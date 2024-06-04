{@type:sensor|@guid:59ff7c8792704ca2b3a855a47ffa0ed0|@path:/1.籌碼監控/散戶下車股價漲|@hash:21bdc3f5e8028589ca53045c5b28e72e}
input:TXT("僅適用日線"); setinputname(1,"使用限制");

settotalbar(3);

if BarFreq <> "D" then return;

if close > high[1] and 
	GetField("散戶買賣超張數")[1] < volume[1] * -0.1  then ret=1;
        