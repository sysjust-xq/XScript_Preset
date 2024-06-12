{@type:autotrade}
{
	修改尚未完全成交的委託的價格
}

var: long_condition(false);		{ 進場買進作多 }
var: exit_long_condition(false);{ 多單全部出場 }

{ 
	範例:
	
	均線穿越時以短天期的均線價格買進1張
	如果等了三根K棒都沒有成交則以目前的市場價格追價
	均線跌破時多單全部平倉
}

value1 = Average(Close, 5);
value2 = Average(Close, 20);
long_condition = value1 cross over value2;
exit_long_condition = value1 cross under value2;	

if Position = 0 and long_condition then begin
	SetPosition(1, value1);		{ 以5日均線的價格買進 }
end;

if Position = 1 and exit_long_condition then begin
	SetPosition(0);				{ 多單全部平倉 }
end else if Position = 1 and TrueAll(Position <> Filled, 3) then begin
	{ 
		送出買進委託後, Position = 1, 如果成交了, Filled = 1,
		Position <> Filled 在這裡則代表著委託已經送出, 可是還沒有成交,
	
		Position, Filled, 跟value1, value2, Close一樣, 都是一個"序列",
		
		所以Position[1]是上一根K棒最後的Position, Filled[1]是上一根K棒最後的Filled,
		
		所以TrueAll(Position <> Filled, 3) 代表著連續三根K棒都沒有成交 			
	}
	SetPosition(1, Close);		{ 修改委託價格為目前成交價 }
end;	
