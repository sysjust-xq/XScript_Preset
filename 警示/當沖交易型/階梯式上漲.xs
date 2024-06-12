{@type:sensor}
input:TXT1("僅適用1分鐘線"); setinputname(1,"使用限制");
input:TXT2("只於9:10判斷"); setinputname(2,"使用說明");
settotalbar(12);
if barfreq = "Min" and barinterval = 1 and time =91000 and
   TrueAll(close >Close[1] ,10) then ret=1;




