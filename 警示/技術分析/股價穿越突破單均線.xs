{@type:sensor}
input: length(5); setinputname(1,"均線期數");
input: Price(Close); setinputname(2,"價格別");

settotalbar(3);
setbarback(length);

variable: avgValue(0);
avgValue = Average(Price,length);

if close > avgValue and  open < avgValue  then ret=1;  



        