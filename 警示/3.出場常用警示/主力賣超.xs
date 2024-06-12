{@type:sensor}
input:PastDays(3); setinputname(1,"計算天數");
input:summ(2000);setinputname(2,"合計賣超張數門檻");
input:TXT("僅適用日線"); setinputname(3,"使用限制");

settotalbar(PastDays + 3);

if Barfreq = "D" and close< close[1] and
   summation(GetField("LeaderDifference")[1],PastDays) <= summ*-1 then ret=1;