{@type:sensor}
input:Length(20); setinputname(1,"高低計算期數");
settotalbar(3);
setbarback(Length);
variable:HighLow(0);
HighLow=high-low;
if C>highest(H[1],Length) *1.005 and  HighLow>highest(HighLow[1],Length) then ret=1;