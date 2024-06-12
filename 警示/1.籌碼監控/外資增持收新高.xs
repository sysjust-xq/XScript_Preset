{@type:sensor}
input: pastDays(3); setinputname(1,"近期天數");
input: _buyAmount(3000); setinputname(2,"累積金額(萬)");
input:TXT("僅適用日線"); setinputname(3,"使用限制");

variable: SumForce(0);

settotalbar(pastdays + 3);

if BarFreq <> "D" then return;

if close > highest(high[1],pastDays) then 
begin
	// 過去N日外資買超金額
    //	
    SumForce = Summation((AvgPrice * GetField("外資買賣超")/10)[1], pastDays);

	if SumForce > _buyAmount   then ret =1;
end;
        