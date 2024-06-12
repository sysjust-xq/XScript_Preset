{@type:sensor}
input:TXT1("僅適用1分鐘線"); setinputname(1,"使用限制");
settotalbar(3);
if barfreq ="Min" and barinterval =1 and
   close[1]/close[2]>1.015 and //上個1分鐘線單分鐘拉超過1.5%
   GetField("High", "D") > high and //高不過高
   Close < GetField("High", "D")*0.99 and //自高檔回1%
   Close > Low[1] 
then ret=1;