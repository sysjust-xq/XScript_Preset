{@type:autotrade}
{
	冰山單(Iceberg): 把要買進的數量分批低掛

	輸入參數:
	
	- 最高價格 (ice_maxprice: 當市價超過這個價格時, 就暫停交易)
	- 委託價差 (ice_below: 目前市價=X時, 委託價格=X-ice_below(for buying), 也就是低買的價格位置, 目前是定義成絕對值)
	- 委託方向 (ice_bs: 1=買進, -1=賣出)
	- 委託總數量 (ice_totalqty: 預期總成交數量)
	- 每次委託數量 (ice_batchqty: 每一次委託單的大小)
	
	執行邏輯(for買進)
	
	- 當目前價格 = X時, 如果X <= ice_maxprice, 送出一筆委託單, 價格 = X - ice_below, 數量 = ice_batchqty,
	- 如果成交的話, 依照目前的價格送出下一筆委託單,
	- 如果目前的價格Y >= X + 2 * ice_below, and Y <= ice_maxprice, 則取消剩餘委託, 用目前的市場價格重新送出
	- Buy the dip => 低接

	Note: 以下程式碼假設商品一開始的部位 = 0
}

input: ice_maxprice(14000, "最高價格");
input: ice_below(10, "委託單價差");
input: ice_bs(1, "買賣方向", inputKind:=Dict(["買進", 1], ["賣出", -1]));
input: ice_totalqty(100, "總委託數量");
input: ice_batchqty(10, "每次委託數量");

var: intrabarpersist ice_lastorderprice(0);		// 最後一次委託價格
var: intrabarpersist ice_started(false);		// 已經啟動Iceberg交易

if not ice_started and GetInfo("TradeMode") = 1 then begin
	ice_started = true;
	ice_lastorderprice = 0;
end;

{ 冰山交易邏輯 }
if ice_started and Filled <> ice_bs * ice_totalqty then begin

	{ 如果目前市場價格超過最大值, 則不處理. 已經送出的委託就維持不動 }
	if (ice_bs = 1 and Close > ice_maxprice) or 
	   (ice_bs = -1 and Close < ice_maxprice) then 
	   return;

	if Position = 0 then begin
		{ 送出第一次委託 }
		ice_lastorderprice = Close - ice_bs * ice_below;
		SetPosition(ice_bs * ice_batchqty, ice_lastorderprice);
	end else if Position = Filled then begin
		{ 送出下一批次委託 }
		ice_lastorderprice = Close - ice_bs * ice_below;
		SetPosition(Position + ice_bs * ice_batchqty, ice_lastorderprice);
	end else if ice_bs = 1 and Close > ice_lastorderprice + 2 * ice_below then begin
		{ 價格移動, 追價 }
		ice_lastorderprice = Close - ice_bs * ice_below;
		SetPosition(Position, ice_lastorderprice);
	end else if ice_bs = -1 and Close < ice_lastorderprice - 2 * ice_below then begin
		{ 價格移動, 追價 }
		ice_lastorderprice = Close - ice_bs * ice_below;
		SetPosition(Position, ice_lastorderprice);
	end;

end;
 

	

 
	



