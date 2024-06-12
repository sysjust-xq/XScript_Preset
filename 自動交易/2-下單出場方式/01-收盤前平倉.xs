{@type:autotrade}
{
	收盤前平倉
}

input: exit_period(2, "收盤前N分鐘平倉");

var: long_condition(false);			{ 進場買進作多 }
var: exit_long_condition(false);	{ 多單出場 }
var: market_close_condition(false); { 是否已經進入收盤階段 }

{ 
	範例:
	
	均線穿越時買進1張
	均線跌破時賣出
	進場後如果連續下跌3筆時賣出
	收盤前N分鐘如果還有部位的話賣出(當日部位一定歸0)
}

long_condition = Average(Close, 5) cross over Average(Close, 20);
exit_long_condition = Average(Close, 5) cross under Average(Close, 20);	

{ 判斷是否已經進入收盤階段 }
market_close_condition = EnterMarketCloseTime(exit_period);

if Position = 0 and long_condition and not market_close_condition then begin
	SetPosition(1);				{ 買進1張: 請注意如果接近收盤時間, 則不進場 }
end else if Position = 1 and exit_long_condition then begin
	SetPosition(0);				{ 出場 }
end else if Position = 1 and market_close_condition then begin
	SetPosition(0);				{ 進入收盤階段: 出場 }
end;
