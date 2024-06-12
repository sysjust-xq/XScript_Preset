{@type:sensor}
input:TXT("僅適用日線"); setinputname(1,"使用限制");

settotalbar(3);

if BarFreq <> "D" then return;

if close > high[1] and 
	GetField("散戶買賣超張數")[1] < volume[1] * -0.1  then ret=1;
        