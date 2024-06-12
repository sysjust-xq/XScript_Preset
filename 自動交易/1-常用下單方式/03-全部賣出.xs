{@type:autotrade}
{
	多單全部賣出
}

var: long_condition(false);			{ 進場買進作多 }
var: exit_long_condition(false);	{ 多單全部出場 }

{ 
	範例:
	
	多單進場: 每次遇到均線穿越或是連續上漲3筆時就買進1張(可以買進很多張, 沒有限制)
	均線跌破時賣出全部
}

long_condition = 
	Average(Close, 5) cross over Average(Close, 20) or
	TrueAll(Close > Close[1], 3);
	
exit_long_condition = Average(Close, 5) cross under Average(Close, 20);	

if long_condition then begin
	SetPosition(Position + 1);		{ 多單+1: 使用預設買進價格 }
									{ SetPosition(Position+1)的意思就是比目前部位多買1筆 }
									{ 也可以使用 Buy(1), 代表多單加碼1張 }
end;

if Position > 0 and exit_long_condition then begin
	SetPosition(0);					{ 多單全部出場: 把Position調成0, 使用預設賣出價格 }
end;
	