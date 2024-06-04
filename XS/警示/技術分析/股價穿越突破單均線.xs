{@type:sensor|@guid:bce4e7bd9589436db0549fe8cb997467|@path:/技術分析/股價穿越突破單均線|@hash:69256eca9fa6920ebe439751a47215e5}
input: length(5); setinputname(1,"均線期數");
input: Price(Close); setinputname(2,"價格別");

settotalbar(3);
setbarback(length);

variable: avgValue(0);
avgValue = Average(Price,length);

if close > avgValue and  open < avgValue  then ret=1;  



        