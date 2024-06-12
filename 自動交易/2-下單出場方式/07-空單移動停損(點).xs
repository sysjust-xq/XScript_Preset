{@type:autotrade}
{
	空單移動停損(點)

	設定停損點, 跟停利點(如果不設定停利的話請把profit_point設定成0)
	價格碰觸到停損/停利點時出場
	如果價格下跌時, 停損點會跟著下跌	
}

input: profit_point(10, "停利(點)");
input: loss_point(10, "停損(點)");

var: short_condition(false);		{ 進場做空 }

{ 
	範例:
	
	均線跌破時做空賣出1張
	以成交價為基礎, 設定固定停利以及移動停損
}

if loss_point = 0 then raiseruntimeerror("請設定停損(點)");

short_condition = Average(Close, 5) cross under Average(Close, 20);

if Position = 0 and short_condition then begin
	SetPosition(-1);			{ 做空賣出1張 }
end;

if Position = -1 and Filled = -1 then begin
	{ 依照成本價格設定停損/停利 }
	var: intrabarpersist stoploss_point(0);
	
	{ 計算停損價格 }
	if stoploss_point = 0 then begin
		stoploss_point = FilledAvgPrice + loss_point;
	end;
	
	{ 如果價格下跌的話, 則往下挪動停損價格. 停損價格只會越來越低 }
	if Close < FilledAvgPrice then begin
		if Close + loss_point < stoploss_point then begin
			stoploss_point = Close + loss_point;
		end;	
	end;	
	
	if profit_point > 0 and Close <= FilledAvgPrice - profit_point then begin
		{ 停利 }
		SetPosition(0);
		stoploss_point = 0;
	end else if Close >= stoploss_point then begin
		{ 停損 }
		SetPosition(0);
		stoploss_point = 0;
	end;
end;
	
	
	
