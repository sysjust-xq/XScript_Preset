{@type:sensor}
input: Periods(120); setinputname(1,"計算期數");
input: Ratio(50);setinputname(2,"期間漲幅%");
input: Sizes(2000);setinputname(3,"五日均量量縮張數");
input:TXT1("僅適用日線"); setinputname(4,"使用限制");
input:TXT2("需選用逐筆洗價"); setinputname(5,"使用說明");
settotalbar(3);
setbarback(Periods);

if BarFreq = "D"  and currenttime>130000 and
   getfield("融資餘額張數")[1] > 2000 and //昨日融資餘額多於2000張
   getfield("融券餘額張數")[1] < 2000 and //昨日融券餘額少於2000張
   close >= close[Periods] *(1 + Ratio*0.01) and //過去半年漲幅超過五成
   average(volume[1],5) < Sizes and //五日均量低於N張
   GetQuote("DailyVolume")< 500 and //當日總量
   GetQuote("OutSize") < GetQuote("DailyVolume")*0.5 //當日外盤量小於總量一半
then ret=1;
