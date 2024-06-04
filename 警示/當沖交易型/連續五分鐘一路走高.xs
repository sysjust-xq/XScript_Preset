{@type:sensor|@guid:e446d207818346dcb8f3b81d1c849fe8|@path:/當沖交易型/連續五分鐘一路走高}
input:TXT1("僅適用1分鐘線"); setinputname(1,"使用限制");
settotalbar(8);
if barfreq = "Min" and barinterval = 1 and
   TrueAll(close >Close[1] ,5) then ret=1;