{@type:filter}
SetTotalBar(23);

value1=truerange();
value2=highest(value1,20);

if value1 > value2[1] and 
   value1 > value1[1] and 
   close*1.01 > high and 
   close > close[1]
then ret=1;
