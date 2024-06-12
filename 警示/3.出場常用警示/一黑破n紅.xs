{@type:sensor}
input:Length(3); setinputname(1,"計算期數");

settotalbar(Length + 3);

if high=highest(high[1],Length) and close<lowest(low[1],Length) 
then ret=1;