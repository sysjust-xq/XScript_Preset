{@type:sensor}
input:Length(5);setinputname(1,"計算震盪幅度的區間期數");
input:BaseLength(20);setinputname(2,"震盪幅度計算區間");
input:Ratio(50);setinputname(3,"震盪放大百分比%");

settotalbar(8);
setbackbar(maxlist(Length,BaseLength));

value1=highest(high,Length)-lowest(low,Length);
value2=average(value1,BaseLength);

if	value1 crosses over value2 *(1+ratio/100) and close=low
then ret=1;
