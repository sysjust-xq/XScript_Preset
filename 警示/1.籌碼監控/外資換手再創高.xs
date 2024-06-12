{@type:sensor}
Input: Percent(30); SetInputName(1, "外資換手比重(%)");
input:TXT("僅適用日線"); setinputname(2,"使用限制");

variable:FB(0);	FB=GetField("外資買張")[1];
variable:FS(0); FS=GetField("外資賣張")[1];	

settotalbar(5);

if BarFreq <> "D" then return;

if close > high[1] and FB-FS > 0 and (FB+FS) > 2 * volume[1] * Percent / 100  then ret=1;
