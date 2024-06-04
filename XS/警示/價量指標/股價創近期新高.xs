{@type:sensor|@guid:14c7a5851fe24e72926fcd4ca5fea27f|@path:/價量指標/股價創近期新高|@hash:4858eb3297e8288ca2f4e35385da73e8}
input: Price(close); setinputname(1,"比較價別");
input: Length(20); setinputname(2,"近期期數");
settotalbar(3);
setbarback(Length);
if  Price > highest(high[1] ,Length) then ret=1;



