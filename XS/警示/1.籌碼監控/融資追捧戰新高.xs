{@type:sensor|@guid:062db1f9913f4a56be8cc78477f64e3d|@path:/1.籌碼監控/融資追捧戰新高|@hash:44cdfecc4f9200777958e7ed430ef079}
input: pastDays(10); setinputname(1,"計算天數");
input:TXT("僅適用日線"); setinputname(2,"使用限制");

settotalbar(pastDays + 3);

if BarFreq <> "D" then return;

if Getfield("融資餘額張數")[1] = highest(Getfield("融資餘額張數")[1] ,pastDays) and
   close >= highest(high[1],pastDays)  
then ret=1;



        