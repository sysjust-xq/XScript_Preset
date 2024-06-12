{@type:autotrade}
{
	多單減碼
}

var: add_one_condition(false);		{ 多單加碼1張 }
var: reduce_one_condition(false);	{ 多單減碼1張}
var: exit_long_condition(false);	{ 多單全部出場 }

{ 
	範例:
	
	多單進場: 每次連續上漲3筆時就買進1張(可以買進很多張, 沒有限制)
	多單減碼: 每次連續下跌3筆時就減碼1張(最多減碼到0)
	均線跌破時賣出全部
}

add_one_condition = TrueAll(Close > Close[1], 3);
reduce_one_condition = TrueAll(Close < Close[1], 3);	
exit_long_condition = Average(Close, 5) cross under Average(Close, 20);	

if add_one_condition then begin
	Buy(1);							{ 多單+1: 使用預設買進價格 }
end;

if Position > 0 then begin
	{ 請注意: 因為可能同時會符合多單出場以及多單減碼的情形, 所以邏輯上要依照優先順序檢查. }
	if exit_long_condition then begin
		SetPosition(0);				{ 多單全部出場: 把Position調成0, 使用預設賣出價格 }
	end else if reduce_one_condition then begin
		Sell(1);					{ 多單賣出1張, 使用預設的賣出價格 }
	end;
end;
