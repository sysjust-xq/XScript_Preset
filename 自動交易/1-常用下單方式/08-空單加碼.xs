{@type:autotrade}
{
	多單加碼
}

var: short_condition(false);		{ 做空進場 }
var: add_one_condition(false);		{ 空單加碼1張 }
var: exit_short_condition(false);	{ 空單全部出場 }

{ 
	範例:
	
	空單進場: 均線跌破時做空1張(部位最多=-1)
	空單加碼: 如果已經做空, 又連續下跌3筆, 則加碼1張
	均線突破時全部回補
}

short_condition = Average(Close, 5) cross under Average(Close, 20);
add_one_condition = TrueAll(Close < Close[1], 3);	
exit_short_condition = Average(Close, 5) cross over Average(Close, 20);	

if Position = 0 and short_condition then begin
	SetPosition(-1);				{ 空單1張: 使用預設賣出價格 }
end;

if Position = -1 and add_one_condition then begin
	SetPosition(-2);				{ 空單加碼1張變成-2 }
end;

if Position < 0 and exit_short_condition then begin
	SetPosition(0);					{ 空單全部出場: 把Position調成0, 使用預設買進價格 }
end;
	