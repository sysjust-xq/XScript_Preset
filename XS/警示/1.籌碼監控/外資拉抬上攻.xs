{@type:sensor|@guid:9c994ac437394dc6a8a1be85eb42b2b3|@path:/1.籌碼監控/外資拉抬上攻|@hash:4bf7cd3e2829f58389340e67efd40777}
input: pastDays(3); setinputname(1,"計算天數");
input: _BuyRatio(25); setinputname(2,"買超佔比例(%)");
input:TXT("僅適用日線"); setinputname(3,"使用限制");

variable: SumForce(0);
variable: SumTotalVolume(0);

settotalbar(pastdays + 3);

if BarFreq <> "D" then return;

if Close > High[1] then
begin
	SumTotalVolume = Summation(volume[1], pastDays);
	SumForce = Summation(GetField("外資買賣超")[1], pastDays);

	if SumForce > SumTotalVolume * _BuyRatio / 100 then ret =1;
end;


        