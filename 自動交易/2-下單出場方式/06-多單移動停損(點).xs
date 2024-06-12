{@type:autotrade}
{
	多單移動停損(點)

	設定停損點, 跟停利點(如果不設定停利的話請把profit_point設定成0)
	價格碰觸到停損/停利點時出場
	如果價格上漲時, 停損點會跟著上漲	
}

input: profit_point(10, "停利(點)");
input: loss_point(10, "停損(點)");

var: long_condition(false);			{ 進場買進作多 }

{ 
	範例:
	
	均線穿越時買進1張
	以成交價為基礎, 設定固定停利以及移動停損
}

if loss_point = 0 then raiseruntimeerror("請設定停損(點)");

long_condition = Average(Close, 5) cross over Average(Close, 20);

if Position = 0 and long_condition then begin
	SetPosition(1);				{ 買進1張 }
end;

if Position = 1 and Filled = 1 then begin
	{ 依照成本價格設定停損/停利 }
	var: intrabarpersist stoploss_point(0);
	
	{ 計算停損價格 }
	if stoploss_point = 0 then begin
		stoploss_point = FilledAvgPrice - loss_point;
	end;
	
	{ 如果價格上漲的話, 則往上挪動停損價格. 停損價格只會越來越高 }
	if Close > FilledAvgPrice then begin
		if Close - loss_point > stoploss_point then begin
			stoploss_point = Close - loss_point;
		end;	
	end;	
	
	if profit_point > 0 and Close >= FilledAvgPrice + profit_point then begin
		{ 停利 }
		SetPosition(0);
		stoploss_point = 0;
	end else if Close <= stoploss_point then begin
		{ 停損 }
		SetPosition(0);
		stoploss_point = 0;
	end;
end;
	
	
	
