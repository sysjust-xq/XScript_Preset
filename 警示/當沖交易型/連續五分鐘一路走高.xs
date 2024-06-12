{@type:sensor}
input:TXT1("僅適用1分鐘線"); setinputname(1,"使用限制");
settotalbar(8);
if barfreq = "Min" and barinterval = 1 and
   TrueAll(close >Close[1] ,5) then ret=1;