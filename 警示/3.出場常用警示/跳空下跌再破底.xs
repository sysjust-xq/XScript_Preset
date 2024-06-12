{@type:sensor}
//分鐘線
input:Gapratio(1.5);setinputname(1,"跳空下跌百分比%");
input:TXT("僅適用分鐘線"); setinputname(2,"使用限制");

settotalbar(5);

if barfreq<>"Min" then return;

if Close < close[1] and Close < GetField("Open", "D") then 
   if GetField("Open", "D") < GetField("RefPrice", "D")*(100-Gapratio)/100  then ret=1;
