{@type:sensor}
input: pastDays(3); setinputname(1,"近期天數");
input: _buyAmount(3000); setinputname(2,"累積金額(萬)");
input:TXT("僅適用日線"); setinputname(3,"使用限制");

variable: SumForce(0);

if BarFreq <> "D" then return;

if close > highest(high[1],pastDays) then 
begin
	SumForce = Summation((AvgPrice * GetField("自營商買賣超")/10)[1], pastDays);

	if SumForce > _buyAmount   then ret =1;
end;


        