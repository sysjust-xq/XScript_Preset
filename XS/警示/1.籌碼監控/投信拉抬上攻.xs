{@type:sensor|@guid:f91a60dbf59e465bbcf0738a784d6b5a|@path:/1.籌碼監控/投信拉抬上攻|@hash:8a271e8ee43d52af8ad7cb2f0a346873}
input: pastDays(3); setinputname(1,"計算天數");
input: _BuyRatio(25); setinputname(2,"買超佔比例(%)");
input:TXT("僅適用日線"); setinputname(3,"使用限制");

variable: SumForce(0);
variable: SumTotalVolume(0);

settotalbar(pastDays + 3);

if BarFreq <> "D" then return;

if Close > High[1] then
begin
	SumForce = Summation(GetField("投信買賣超")[1], pastDays);
	sumTotalVolume = Summation(Volume[1], pastDays);

	if SumForce > SumTotalVolume * _BuyRatio/100 then ret =1;

end;

        