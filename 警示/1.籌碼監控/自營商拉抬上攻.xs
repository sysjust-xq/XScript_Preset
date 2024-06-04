{@type:sensor|@guid:014fc28010944aa0beffbdaefd493cc2|@path:/1.籌碼監控/自營商拉抬上攻|@hash:27f255c349ba5cc3ba62e3cd96c60ae3}
input: pastDays(3); setinputname(1,"計算天數");
input: _BuyRatio(25); setinputname(2,"買超佔比例(%)");
input:TXT("僅適用日線"); setinputname(3,"使用限制");

variable: SumForce(0);
variable: SumTotalVolume(0);

settotalbar(pastDays + 3);

if BarFreq <> "D" then return;

if Close > High[1] then
begin
	SumForce = Summation(GetField("自營商買賣超")[1], pastDays);
	SumTotalVolume = Summation(Volume[1], pastDays);

	if SumForce > SumTotalVolume * _BuyRatio / 100 then ret =1;
end;
