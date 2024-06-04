{@type:sensor|@guid:8d0667f319f54ac3a39a98e32600fcd6|@path:/3.出場常用警示/主力賣超|@hash:9da0053d5a24f8d876c89e4de4f74e8b}
input:PastDays(3); setinputname(1,"計算天數");
input:summ(2000);setinputname(2,"合計賣超張數門檻");
input:TXT("僅適用日線"); setinputname(3,"使用限制");

settotalbar(PastDays + 3);

if Barfreq = "D" and close< close[1] and
   summation(GetField("LeaderDifference")[1],PastDays) <= summ*-1 then ret=1;