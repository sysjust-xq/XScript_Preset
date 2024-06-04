{@type:sensor|@guid:dc2cc19da9ce43b38276aa2239d46423|@path:/2.市場常用語/突破上切線|@hash:b433dc6a074cb3a0f22a83f3a6344b03}
input:Length(20); setinputname(1,"上切計算期數");
input:Rate(50); setinputname(2,"陡增率");

settotalbar(Length + 3);

variable: Factor(0);

Factor = 100/Close[Length];

if close > open and close > highest(high[1],Length) and 
   (linearregslope(high*Factor,3) -linearregslope(high*Factor,Length))>Rate*0.01 
then ret=1;