{@type:sensor|@guid:df0cd2f4fe7a4eca8a3330c7a42d12bb|@path:/當沖交易型/開高後不拉回}
input:Ratio(2.5); setinputname(1,"開高幅度%");
input:aRatio(1); setinputname(2,"拉回度%上限");
input:TXT("僅適用於15分鐘以內"); setinputname(3,"使用限制");
settotalbar(3);
if barfreq ="Min" and barinterval <=15 and time <= 091500 and
   GetField("Open", "D") > GetField("RefPrice", "D") *(1+Ratio/100) and 
   Close > GetField("High", "D")* (1- aRatio/100) 
then ret=1;



