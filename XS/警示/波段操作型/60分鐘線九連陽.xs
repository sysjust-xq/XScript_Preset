{@type:sensor|@guid:573ce9613af2442596e362273fe1b61d|@path:/波段操作型/60分鐘線九連陽|@hash:c5f289019df33f5bd90a5075f1aadd80}
input:TXT("僅適用60分鐘線"); setinputname(1,"使用限制");

settotalbar(10);

if barfreq<> "Min" or barinterval <> 60 then return;

if TrueAll(Close > Close[1] and Close > Open ,9) then Ret=1;
