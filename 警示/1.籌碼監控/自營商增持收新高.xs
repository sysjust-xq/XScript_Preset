{@type:sensor|@guid:7c5b9f58674b488b9e44f53f02fbab0c|@path:/1.籌碼監控/自營商增持收新高|@hash:7b86b0ab4b72042a15c16c24da6b1acb}
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


        