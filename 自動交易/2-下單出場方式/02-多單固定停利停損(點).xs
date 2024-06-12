{@type:autotrade}
{
	多單停損(點)
}

input: profit_point(10, "停利(點)");
input: loss_point(10, "停損(點)");

var: long_condition(false);			{ 進場買進作多 }

{ 
	範例:
	
	均線穿越時以市價買進1張
	以成交價為基礎, 設定固定的停損/停利價格, 觸及時出場
}

long_condition = Average(Close, 5) cross over Average(Close, 20);

if Position = 0 and long_condition then begin
	SetPosition(1, MARKET);		{ 以市價買進 }
end;

if Position = 1 and Filled = 1 then begin
	{ 依照成本價格設定停損/停利 }
	
	if profit_point > 0 and Close >= FilledAvgPrice + profit_point then begin
		{ 停利 }
		SetPosition(0);
	end else if loss_point > 0 and Close <= FilledAvgPrice - loss_point then begin	
		{ 停損 }
		SetPosition(0);
	end;
end;

