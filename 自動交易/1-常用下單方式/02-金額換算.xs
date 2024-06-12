{@type:autotrade}
{
	以金額計算交易數量
}

input: ordersize_w(10, "每筆交易金額(萬)");

{ 
	範例:
	
	均線穿越時以指定金額換算張數買進
	均線跌破時以市價賣出全部數量
}

var: long_condition(false);			{ 進場買進作多 }
var: exit_long_condition(false);	{ 多單出場 }


long_condition = Average(Close, 5) cross over Average(Close, 20);
exit_long_condition = Average(Close, 5) cross under Average(Close, 20);	

if Position = 0 and long_condition then begin
	var: order_price(0);		{ 預期委託價格 }
	var: order_qty(0);			{ 換算後數量 }
	
	order_price = AddSpread(Close, 1);	
	order_qty = (ordersize_w * 10000) / (order_price * 1000);
								{ 計算出來的數值如果不是整數, 傳入SetPosition時會自動捨去小數位數 }
								{ 例如 SetPosition(2.5) 執行時會被轉成 SetPosition(2) }

	SetPosition(order_qty, order_price);		{ 以指定價格買入指定數量 }
end;

if Position <> 0 and exit_long_condition then begin
	SetPosition(0, MARKET);		{ 以市價賣出全部數量 }
end;
