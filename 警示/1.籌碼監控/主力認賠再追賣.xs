{@type:sensor}
input:TXT("僅適用日線"); setinputname(1,"使用限制");

variable: pastDays(10);

settotalbar(15);

if BarFreq <> "D" then return;
 
if close < lowest(low[1] ,pastDays) and
   volume > volume[1]*0.5 and
   GetField("主力買賣超張數")[1] < average(volume[1],pastDays)/-7 and
   Summation(GetField("主力買賣超張數")[2],pastDays) > Average(volume[2],pastDays)/7
 then ret =1;
        
	