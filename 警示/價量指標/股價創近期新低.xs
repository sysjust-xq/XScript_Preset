{@type:sensor}
input: Price(close); setinputname(1,"比較價別");
input: Length(20); setinputname(2,"近期期數");
settotalbar(3);
setbarback(Length);
if  Price < Lowest(Low[1] ,Length) then ret=1;



