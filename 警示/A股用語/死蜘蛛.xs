{@type:sensor}
input:ShortLength(5); setinputname(1,"短期均線期數");
input:MidLength(20); setinputname(2,"中期均線期數");
input:LongLength(60); setinputname(3,"長期均線期數");

settotalbar(3);
setbarback(maxlist(ShortLength,MidLength,LongLength));

value1=average(close,ShortLength);
value2=average(close,MidLength);
value3=average(close,LongLength);


condition1  = value1>close;
condition2  = close[1]>value3;

value4=maxlist(value1,value2,value3);
value5=minlist(value1,value2,value3);
value6=(value4-value5)/value4;

condition3 =  value6<0.02;

if condition1 and condition2 and condition3 then ret=1;