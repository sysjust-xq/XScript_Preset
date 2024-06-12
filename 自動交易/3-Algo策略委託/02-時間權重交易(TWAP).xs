{@type:autotrade}
{
	時間權重(TWAP): 類似定時定量交易, 差異是傳入的是執行委託總時間以及委託總數量, 由腳本自己反推算委託間隔/每次委託數量.

	輸入參數:

	- 下單總時間 (order_duration: 在未來的幾(秒)內要執行完畢)
	- 下單總數量 (order_totalqty: 委託的總數量)
	- 買賣方向 (order_bs: 1=買進, -1=賣出)
	
	
	把預期委託數量平均分配在指定的時間範圍內, 例如指定在未來的60分鐘內買進100張
}

input: order_duration(3600, "委託區間(秒)");
input: order_totalqty(100, "總委託數量");
input: order_bs(1, "買賣方向", inputKind:=Dict(["買進", 1], ["賣出", -1]));

{ 
	範例:
	
	策略一啟動就啟動定時定量交易, 全部送完就停止
}

var: intrabarpersist exec_order_started(false);
var: intrabarpersist exec_order_starttime(0);
var: intrabarpersist exec_order_startposition(0);
var: intrabarpersist exec_order_endposition(0);

if not exec_order_started and GetInfo("TradeMode") = 1 then begin
	exec_order_started = true;		{ 啟動定時定量委託 }
	exec_order_starttime = CurrentTime;
	exec_order_startposition = Position;
	exec_order_endposition = Position + order_bs * order_totalqty;
end;

{ 時間權重的執行邏輯 }
if exec_order_started and Position <> exec_order_endposition then begin
	var: duration(0), target_position(0);
	
	duration = TimeDiff(CurrentTime, exec_order_starttime, "S");
	target_position = order_bs * Floor(order_totalqty * duration / order_duration) + exec_order_startposition;
	
	if Position <> target_position then begin
		SetPosition(target_position);		{ TODO: 請填入委託價格 }
	end;	
end;	



