{@type:autotrade}
{
	多單停損(%)
}

input: profit_percent(2, "停利(%)");
input: loss_percent(2, "停損(%)");

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
	
	if profit_percent > 0 and Close >= FilledAvgPrice*(1+0.01*profit_percent) then begin
		{ 停利 }
		SetPosition(0);
	end else if loss_percent > 0 and Close <= FilledAvgPrice*(1-0.01*loss_percent) then begin	
		{ 停損 }
		SetPosition(0);
	end;
end;

