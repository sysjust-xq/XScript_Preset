{@type:sensor|@guid:8a5940b0f425480e8d28a10c3a17270d|@path:/1.籌碼監控/連日外盤攻擊創新高|@hash:d759339ba281adb3d9ee381121bae029}
input:TXT("僅適用日線"); setinputname(1,"使用限制");

settotalbar(3);

if BarFreq <> "D" then return;

if Close > maxlist(high[1],high[2]) and GetField("內盤量","D")>0 and GetField("外盤量") > GetField("內盤量","D") * 1.2  then
begin
	if TrueAll(Getfield("外盤量")[1] > 1.1 * Getfield("內盤量")[1], 3) then ret=1;
end;
        