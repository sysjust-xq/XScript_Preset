{@type:sensor}
input: pastDays(10); setinputname(1,"計算天數");
input:TXT("僅適用日線"); setinputname(2,"使用限制");

settotalbar(pastDays + 3);

if BarFreq <> "D" then return;

if Getfield("融資餘額張數")[1] = highest(Getfield("融資餘額張數")[1] ,pastDays) and
   close >= highest(high[1],pastDays)  
then ret=1;



        