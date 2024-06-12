{@type:autotrade}
{
	空單全部回補
}

var: short_condition(false);		{ 進場賣出做空 }
var: exit_short_condition(false);	{ 空單全部回補 }

{ 
	範例:
	
	空單做空: 每次遇到均線跌破或是連續下跌3筆時就賣出1張(可以做空很多張, 沒有限制)
	均線穿越時回補全部空單
}

short_condition = 
	Average(Close, 5) cross under Average(Close, 20) or
	TrueAll(Close < Close[1], 3);
	
exit_short_condition = Average(Close, 5) cross over Average(Close, 20);	

if short_condition then begin
	SetPosition(Position - 1);		{ 空單+1: 使用預設賣出價格 }
									{ SetPosition(Position-1)的意思就是比目前部位多賣1筆 }
									{ 也可以使用Short(1), 代表空單加碼1張 }
	
end;

if Position < 0 and exit_short_condition then begin
	SetPosition(0);					{ 空單全部回補: 把Position調成0, 使用預設買進價格 }
end;
	