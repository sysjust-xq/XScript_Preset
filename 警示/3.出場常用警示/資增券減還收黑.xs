{@type:sensor}
input:V1(1000); setinputname(1,"融資增加張數");
input:V2(500); setinputname(2,"融券減少張數");
input:TXT("僅適用日線"); setinputname(3,"使用限制");

settotalbar(3);

if BarFreq <> "D" then return;

if close < close[1] and 
   GetField("融資增減張數")[1] > V1 and
   GetField("融券增減張數")[1] < V2*-1
then ret=1;
   
