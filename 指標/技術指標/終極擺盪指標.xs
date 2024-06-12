{@type:indicator}

input:length1(7);		setinputname(1, "天期一");
input:length2(14);		setinputname(2, "天期二");
input:length3(28);   	setinputname(3, "天期三");

variable : ruo(0),uo(0),bp(0);  

bp = close-truelow;
   
Value1=summation(bp,length1);   
Value2=summation(bp,length2);   
Value3=summation(bp,length3);   

Value4=summation(truerange,length1);   
Value5=summation(truerange,length2);   
Value6=summation(truerange,length3);
   
ruo = (value1/value4)*4+(value2/value5)*2+(value3/value6);   

uo= ruo / 7 * 100;   

plot1(uo, "UO");  

