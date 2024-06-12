{@type:sensor}
input: ChangeKshares(1000); setinputname(1,"主力出貨張數");
input:TXT("僅適用日線"); setinputname(2,"使用限制");

settotalbar(3);

if BarFreq <> "D" then return;

if close < low[1] and
	GetField("主力買賣超張數")[1] < ChangeKshares*-1 and 
	GetField("散戶買賣超張數")[1] > ChangeKshares
then ret=1;

        