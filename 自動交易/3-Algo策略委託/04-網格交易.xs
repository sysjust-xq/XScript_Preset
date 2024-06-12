{@type:autotrade}
{
	網格交易: 每當價格跌破一個網格時就買進, 上漲一個網格時則賣出
	
	輸入參數:

	- 網格間隔 (grid_gap: 定義網格的間距)
	- 網格數目 (grid_maxcount: 往上/往下分別設定的網格數目)
	- 停損點 (stoploss_point: 當價格超過停損點時, 執行停損. 停損點通常布置在最大網格之外)
	
	執行邏輯:
	
	- 系統啟動時, 以當時的價格為中心點,
	- 當市價下跌超過一個網格時, 買進1張,
	- 當市價上漲超過一個網格時, 賣出1張, 也就是低買高賣,
	- 如果市價上漲/下跌超過最大網格數目時, 就暫停交易,
	- 如果價格持續上漲/下跌, 當超過停損點的話, 則全部平倉停損 (通常停損點會設定在最大網格數目之外)
		
	舉例:
	
	- 每格100點
	- 共3格
	- 停損點=500
	
	如果在10000點時啟動, 那麼
	
	- 當價格跌破9900時買進1口, 接下來如果漲回10000時賣出1口, 
	- 如果沒有漲回10000, 而是繼續跌到9800時, 則再買進1口 (漲回9900時則賣出1口),
	- 如果持續下跌, 每100點就買進1口, 可是最低就到9700(3格=300點), 再往下跌就不買了,
	- 如果很不幸的, 一直往下跌, 那麼當跌破9500時(10000-500=停損點), 則全部停損,

	- 同理, 如果價格一開始就往上走, 例如漲到10100點時, 就賣出1口, 如果跌回10000點, 則買進1口,
	- 如果繼續上漲, 到了10200點時, 再賣出1口 (跌回10100時則買進1口),
	- 如果很不幸的, 一直往上漲, 那麼當漲到10500時(10000+500=停損點), 則全部停損,

	- 交易邏輯是低買高賣, 預期價格會在區間震盪, 賺取價格在網格之間穿越時的買賣差額	

	Note: 以下程式碼假設商品一開始的部位 = 0
}

input: grid_gap(20, "每格點數");
input: grid_maxcount(3, "最多格數");
input: stoploss_point(100, "停損(點)");

{ 
	範例:
	
	策略一啟動就以當時收盤價為基礎啟動網格交易, 一直跑到停損點觸發為止
}

var: intrabarpersist grid_started(false);	{ 開始網格交易 }
var: intrabarpersist grid_base(0);			{ 網格中心點: 如果不是0的話表示已經啟動 }
var: intrabarpersist grid_current_base(0);	{ 目前的網格中心點: 依照價格移動 }
var: intrabarpersist grid_current_ord(0);	{ 目前的網格的編號, 正中央=0, 往上=1, 2, 3, 往下=-1,-2,-3}
var: intrabarpersist grid_buycount(0);		{ 進入網格後的買進數量合計 }
var: intrabarpersist grid_sellcount(0);		{ 進入網格後的賣出數量合計, 用buycount/sellcount可以估算目前損益(每個買賣賺一個grid) }

if not grid_started and GetInfo("TradeMode") = 1 then begin
	grid_started = true;
	grid_base = Close;
	grid_current_base = Close;
	grid_current_ord = 0;
	grid_buycount = 0;
	grid_sellcount = 0;
	
	Print("=>啟動網格中心點:", numtostr(grid_current_base, 0));
end;

{ 網格交易邏輯 }
if grid_base <> 0 then begin

	if Close >= grid_base + stoploss_point or Close <= grid_base - stoploss_point then begin

		SetPosition(0, label:="網格:停損出場");	{ 全部平倉, 停止網格交易(TODO:請填入委託價格) }
		grid_base = 0;							{ 停止網格交易 }

	end else begin
		{ 
			比對目前價格與current_grid_base, 看價格是否穿越網格跳過幾格
			請注意以下的邏輯有處理一次跳過多格的情形 
		}
		if Close >= grid_current_base + grid_gap then begin
			
			value1 = grid_current_ord + IntPortion((Close - grid_current_base) / grid_gap);
			if value1 >= grid_maxcount then value1 = grid_maxcount;
			value1 = value1 - grid_current_ord;		{ 往上移動的格數 }
			
			if value1 > 0 then begin
				{ 往上移動網格 }
				grid_current_base = grid_current_base + value1 * grid_gap;
				grid_current_ord = grid_current_ord + value1;
				grid_sellcount = grid_sellcount + value1;
				
				SetPosition(Position - value1, label:="網格:上漲賣出");	{ 賣出 (TODO:請填入委託價格) }
			end;

		end else if Close <= grid_current_base - grid_gap then begin
			
			value1 = grid_current_ord - IntPortion((grid_current_base - Close) / grid_gap);
			if value1 <= -1 * grid_maxcount then value1 = -1 * grid_maxcount;
			value1 = grid_current_ord - value1;		{ 往下移動的格數 }
			
			if value1 > 0 then begin
				{ 往下移動網格 }
				grid_current_base = grid_current_base - value1 * grid_gap;
				grid_current_ord = grid_current_ord - value1;
				grid_buycount = grid_buycount + value1;

				SetPosition(Position + value1, label:="網格:下跌買進");	{ 買進 (TODO:請填入委託價格) }
			end;

		end;
	end;	

end;

