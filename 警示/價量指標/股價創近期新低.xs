{@type:sensor|@guid:f15115eb058a499da285deb2662ae6a8|@path:/價量指標/股價創近期新低|@hash:3774a394f71bfc864e648a3c7a6f7f3c}
input: Price(close); setinputname(1,"比較價別");
input: Length(20); setinputname(2,"近期期數");
settotalbar(3);
setbarback(Length);
if  Price < Lowest(Low[1] ,Length) then ret=1;



