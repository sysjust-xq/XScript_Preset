{@type:sensor|@guid:e6744d2ae19d4e5e9322d182587588db|@path:/1.籌碼監控/法人主攻漲升|@hash:dc8e3e3369d98608eef451e042fb435d}
input: pastDays(3); setinputname(1,"計算天數");
input: _BuyRatio(25); setinputname(2,"買超佔比例(%)");
input:TXT("僅適用日線"); setinputname(3,"使用限制");

variable: SumForce(0);
variable: SumTotalVolume(0);

settotalbar(pastDays + 3);

if BarFreq <> "D" then return;

if Close > High[1] and close[1] > close[2] then
begin
	SumForce = Summation(
		(GetField("外資買賣超")+GetField("自營商買賣超")+GetField("投信買賣超"))[1], 
		pastDays);
	SumTotalVolume = Summation(Volume[1], pastDays);

	if SumForce > SumTotalVolume * _BuyRatio / 100  then ret =1;
end;
        