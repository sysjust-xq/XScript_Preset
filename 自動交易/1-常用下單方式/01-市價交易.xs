{@type:autotrade}
{
	市價交易
}

var: long_condition(false);			{ 進場買進作多 }
var: exit_long_condition(false);	{ 多單出場 }

{ 
	範例:
	
	均線穿越時以市價買進1張
	均線跌破時以市價賣出(1張)
}

long_condition = Average(Close, 5) cross over Average(Close, 20);
exit_long_condition = Average(Close, 5) cross under Average(Close, 20);	

if Position = 0 and long_condition then begin
	SetPosition(1, MARKET);		{ 以市價買進 }
end;

if Position = 1 and exit_long_condition then begin
	SetPosition(0, MARKET);		{ 以市價賣出 }
end;
	