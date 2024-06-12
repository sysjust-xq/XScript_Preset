{@type:autotrade}
{
	多單加碼
}

var: long_condition(false);			{ 進場買進作多 }
var: add_one_condition(false);		{ 多單加碼1張 }
var: exit_long_condition(false);	{ 多單全部出場 }

{ 
	範例:
	
	多單進場: 均線穿越做多1張(部位最多=1)
	多單加碼: 如果已經做多, 又連續上漲3筆, 則加碼1張
	均線跌破時賣出全部
}

long_condition = Average(Close, 5) cross over Average(Close, 20);
add_one_condition = TrueAll(Close > Close[1], 3);	
exit_long_condition = Average(Close, 5) cross under Average(Close, 20);	

if Position = 0 and long_condition then begin
	SetPosition(1);					{ 多單1張: 使用預設買進價格 }
end;

if Position = 1 and add_one_condition then begin
	SetPosition(2);					{ 加碼1張變成2張 }
end;

if Position > 0 and exit_long_condition then begin
	SetPosition(0);					{ 多單全部出場: 把Position調成0, 使用預設賣出價格 }
end;
	