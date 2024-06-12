{@type:autotrade}
{
	定時定量: 每隔多久送出一筆委託, 下多少筆之後就停止
	
	輸入參數:

	- 下單間隔 (order_interval: 每隔幾(秒)送出一筆委託)
	- 下單數量 (order_qty: 每一筆委託的數量)
	- 買賣方向 (order_bs: 1=買進, -1=賣出)
	- 委託筆數 (order_count: 總共要送出幾筆)	

	
}

input: order_interval(60, "下單間隔(秒)");
input: order_qty(1, "每次下單數量");
input: order_bs(1, "買賣方向", inputKind:=Dict(["買進", 1], ["賣出", -1]));
input: order_count(10, "下單筆數");

{ 
	範例:
	
	策略一啟動就啟動定時定量交易, 全部送完就停止
}

var: intrabarpersist exec_order_started(false);
var: intrabarpersist exec_order_lasttime(0);
var: intrabarpersist exec_order_count(0);

if not exec_order_started and GetInfo("TradeMode") = 1 then begin
	exec_order_started = true;		{ 啟動定時定量委託 }
	exec_order_count = 0;
	exec_order_lasttime = 0;
end;

{ 定時定量的執行邏輯 }
if exec_order_started and exec_order_count < order_count then begin
	if exec_order_lasttime = 0 or TimeDiff(CurrentTime, exec_order_lasttime, "S") >= order_interval then begin
		{ 執行委託 }
		Print("order_bs=", order_bs, "order_qty=", order_qty);
		SetPosition(position + order_bs * order_qty);			{ TODO: 請填入委託價格 }
		exec_order_count = exec_order_count + 1;
		exec_order_lasttime = CurrentTime;
	end;
end;	
