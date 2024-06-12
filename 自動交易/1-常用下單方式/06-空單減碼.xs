{@type:autotrade}
{
	空單減碼
}

var: short_one_condition(false);	{ 空單加碼1張 }
var: reduce_one_condition(false);	{ 空單減碼(回補)1張}
var: exit_short_condition(false);	{ 空單全部回補 }

{ 
	範例:
	
	空單進場: 每次連續下跌3筆時就賣出1張(可以賣出很多張, 沒有限制)
	空單減碼: 每次連續上漲3筆時就減碼(回補)1張(最多減碼到0)
	均線穿越時回補全部
}

short_one_condition = TrueAll(Close < Close[1], 3);
reduce_one_condition = TrueAll(Close > Close[1], 3);	
exit_short_condition = Average(Close, 5) cross over Average(Close, 20);	

if short_one_condition then begin
	Short(1);						{ 空單+1: 使用預設賣出價格 }
end;

if Position < 0 then begin
	{ 請注意: 因為可能同時會符合空單出場以及空單減碼的情形, 所以邏輯上要依照優先順序檢查. }
	if exit_short_condition then begin
		SetPosition(0);				{ 空單全部出場: 把Position調成0, 使用預設買進價格 }
	end else if reduce_one_condition then begin
		Cover(1);					{ 空單回補1張, 使用預設的買進價格 }
	end;
end;
