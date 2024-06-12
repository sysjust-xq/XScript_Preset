{@type:sensor}
input:day(5); setinputname(1,"投信連續賣超天數");
input:ratio(60);setinputname(2,"合計賣超減持幅度%");
input:TXT1("僅適用日線"); setinputname(3,"使用限制");
input:TXT2("須逐筆洗價"); setinputname(4,"使用說明");
settotalbar(day + 3);

if close>open and close[3] > close[1] * 1.1  and BarFreq ="D" then
begin
  if TrueAll(GetField("Sdifference")[1] <0,day) and
     GetField("Ssharesheld")[1] < GetField("Ssharesheld")[Day+1] * (1- Ratio/100) 
  then ret=1;
end;

