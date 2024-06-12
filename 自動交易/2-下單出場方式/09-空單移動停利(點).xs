{@type:autotrade}
{
	空單移動停利(點)

	設定停損點(如果不設定的話, 請把loss_point設定成0), 以及停利點, 跟回跌點數
	價格上漲到停損時出場
	價格下跌停利點後啟動移動停利, 如果價格繼續下跌, 則繼續持有, 如果價格回檔超過回跌點數時, 則停利出場
}

input: profit_point(10, "停利(點)");
input: profit_drawback_point(5, "停利回跌(點)");
input: loss_point(10, "停損(點)");

var: short_condition(false);		{ 進場買空 }

{ 
	範例:
	
	均線跌破時做空賣出1張
	以成交價為基礎, 設定固定停損以及移動停利
}

if profit_point = 0 then raiseruntimeerror("請設定停利(點)");
if profit_drawback_point = 0 then raiseruntimeerror("請設定停利回跌(點)");
if profit_drawback_point > profit_point then raiseruntimeerror("停利(點)需大於停利回跌(點)");

short_condition = Average(Close, 5) cross under Average(Close, 20);

if Position = 0 and short_condition then begin
	SetPosition(-1);			{ 做空賣出1張 }
end;

if Position = -1 and Filled = -1 then begin
	var: intrabarpersist max_profit_point(0);	{ 啟動停利後最大獲利點 }

	if loss_point > 0 and Close >= FilledAvgPrice + loss_point then begin
		{ 停損 }
		SetPosition(0);
		max_profit_point = 0;

	end else begin
	
		{ 判斷是否要啟動停利 }
		if max_profit_point = 0 and Close <= FilledAvgPrice - profit_point then begin
			max_profit_point = Close;
		end;
		
		if max_profit_point <> 0 then begin		
			if Close >= max_profit_point + profit_drawback_point then begin
				{ 停利 }
				SetPosition(0);
				max_profit_point = 0;
			end else if Close < max_profit_point then begin
				{ 移動最大獲利點 }
				max_profit_point = Close;
			end;	
		end;		
	end;

end;

