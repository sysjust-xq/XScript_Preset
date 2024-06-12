{@type:sensor}
input:TXT("僅適用60分鐘線"); setinputname(1,"使用限制");

settotalbar(10);

if barfreq<> "Min" or barinterval <> 60 then return;

if TrueAll(Close > Close[1] and Close > Open ,9) then Ret=1;
