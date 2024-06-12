{@type:autotrade}
{
	分量權重(VWAP): 把預期委託數量依照歷史成交量分布, 在指定的時間範圍送出內, 預期成交均價可以接近歷史均價
	
	輸入參數:

	- 統計天數 (vwap_days: 決定要用前幾天的成交量統計)
	- 開始交易時間 (start_hhmm: 交易開始時間, 格式為hhmm, 例如0905, 表示從09:05開始進行交易)
	- 結束交易時間 (end_hhmm: 交易結束時間, 格式為hhmm, 例如1300, 表示交易到1300就停止)
	- 交易數量 (order_totalqty: 預計交易的數量)
	- 交易方向 (order_bs: 1=買進, -1=賣出)
	
	執行邏輯:
	
	- 策略起動時根據vwap_days統計出每分鐘的成交數量分佈比例(從09:00~13:30),
	- 依照指定的交易區間(start_hhmm ~ end_hhmm), 以及預期交易數量, 決定每分鐘的委託數量,
	- 舉例
		- start_hhmm = 09:10, end_hhmm = 10:00
		- 依照歷史統計, 09:10的成交量=1%, 09:11的成交量=0.8%, .. 09:59的成交量=1.5%
		- 假設order_totalqty = 500, 則
		- 在09:11(09:10結束時), 送出500 * 1% / (1% + 0.8% + .. + 1.5%), 
		- 在09:12(09:11結束時), 送出500 * 0.8% / (1% + 0.8% + .. + 1.5%),
		- 在10:00(09:59結束時), 送出500 * 1.5% / (1% + 0.8% + .. + 1.5%),
		- 也就是說, 在指定時間範圍內, 依照歷史成交量的分佈, 每分鐘送出委託,
	
}

input: vwap_days(1, "用前N日的資料來計算成交量分佈");
input: start_hhmm(0905, "分鐘起點(HHMM)");
input: end_hhmm(1000, "分鐘終點(HHMM)");
input: order_totalqty(1000, "總委託數量");
input: order_bs(1, "買賣方向", inputKind:=Dict(["買進", 1], ["賣出", -1]));

if start_hhmm >= end_hhmm then raiseruntimeerror("開始時間必須 < 結束時間");

{ 請確認Backbar有足夠的空間可以讀入vwap_days的資料 }

var: intrabarpersist vwap_started(false);
var: intrabarpersist vwap_base_position(0);
var: intrabarpersist vwap_time_index(0);
array: intrabarpersist vwap_dist[](0);		// N日統計分佈, 總共有total_minute格, 每一格是到目前為止的百分比
var: intrabarpersist vwap_totalminutes(0);

var: intrabarpersist start_hhmmss(0), intrabarpersist end_hhmmss(0); 

var: start_condition(false);			{ 啟動定時定量委託 }

if not vwap_started and GetInfo("TradeMode") = 1 then begin

	// 如果使用者指定 09:01 ~ 10:00, 因為分K是標在時間起點, 
	// 所以我們要統計的是09:01 ~ 09:59這些分K的成交量分佈 (所以end_hhmm會-1分鐘)

	start_hhmmss = start_hhmm * 100;
	end_hhmmss = TimeAdd(end_hhmm * 100, "M", -1);

	CalcVWAPDistribution(vwap_days, start_hhmmss, end_hhmmss, vwap_dist);
	vwap_totalminutes = Array_GetMaxIndex(vwap_dist);
	vwap_started = true;
	vwap_base_position = Position;
	vwap_time_index = 0;
end;

{ VWAP的執行邏輯 }

if vwap_started and Position <> vwap_base_position + order_bs * order_totalqty then begin
	if CurrentTime >= start_hhmmss then begin
		{ 計算目前時間是開始時間後的第幾分鐘 }
		value1 = IntPortion(TimeDiff(CurrentTime, start_hhmmss, "M"));
		
		if value1 > vwap_time_index then begin
			{ 預期的成交量比例  = vwap_dist[value1] }
			if value1 >= vwap_totalminutes then 
				value2 = 100				{ 超過時間 => 100% }
			else	
				value2 = vwap_dist[value1];

			value3 = value2	* order_totalqty * order_bs / 100;
			
			if Position <> vwap_base_position + value3 then begin
				{ 送出委託單 }
				SetPosition(vwap_base_position + value3);	{ TODO: 請填入委託價格 }
			end;	
			vwap_time_index = value1;
		end;
	end;
end;	



