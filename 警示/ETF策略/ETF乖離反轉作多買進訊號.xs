{@type:sensor}
input:Length(20); setinputname(1,"計算期數");
input:Ratio(21); setinputname(2,"乖離%");

variable:KPrice(0);
if close/average(close,Length)<= 1-Ratio/100 then KPrice = H;
if Close crosses over KPrice
then ret=1 ;
