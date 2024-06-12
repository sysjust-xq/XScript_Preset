{@type:sensor}
input:Periods(5); setinputname(1,"外資連續買超天數");
input:TXT1("僅適用日線"); setinputname(2,"使用限制");

settotalbar(3);
setbarback(Periods);

if BarFreq <> "D"  then return;

Ret = TrueAll(GetField("外資買賣超")[1] > 0, Periods);
