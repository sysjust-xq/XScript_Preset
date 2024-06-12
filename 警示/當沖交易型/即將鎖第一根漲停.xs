{@type:sensor}
input:Length(20); setinputname(1,"過去無漲停期數");
input:Ratio(1); setinputname(2,"差幾%漲停");
input:TXT("請用日線逐筆洗價"); setinputname(3,"使用限制");

settotalbar(Length + 3);

if BarFreq = "D" then 
  if Close > GetField("漲停價", "D")*(1- Ratio/100)  then
    if TrueAll(close[1] < Close[2]*1.068,Length) then ret=1;
