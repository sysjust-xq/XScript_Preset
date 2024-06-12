{@type:sensor}
input: Percent(1);  setinputname(1,"距離漲停百分比");

settotalbar(3);

if close > GetField("漲停價", "D")*(1-Percent/100) then ret =1;