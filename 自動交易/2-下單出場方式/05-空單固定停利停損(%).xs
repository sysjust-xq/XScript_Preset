{@type:autotrade}
{
	空單停損(%)
}

input: profit_percent(2, "停利(%)");
input: loss_percent(2, "停損(%)");

var: short_condition(false);			{ 進場做空 }

{ 
	範例:
	
	均線跌破時以市價賣出1張做空
	以成交價為基礎, 設定固定的停損/停利價格, 觸及時出場
}

short_condition = Average(Close, 5) cross under Average(Close, 20);

if Position = 0 and short_condition then begin
	SetPosition(-1, MARKET);		{ 以市價賣出 }
end;

if Position = -1 and Filled = -1 then begin
	{ 依照成本價格設定停損/停利: 請注意當作空時, 判斷是否獲利的方向要改變 }
	
	if profit_percent > 0 and Close <= FilledAvgPrice*(1-0.01*profit_percent) then begin
		{ 停利 }
		SetPosition(0);
	end else if loss_percent > 0 and Close >= FilledAvgPrice*(1+0.01*loss_percent) then begin	
		{ 停損 }
		SetPosition(0);
	end;
end;

