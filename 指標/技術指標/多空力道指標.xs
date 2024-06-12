{@type:indicator}
input: length(5);	setinputname(1, "天期");

Value1 = high - close;   
Value2 = close - low; 

Value3 = average(Value1,length);   
Value4 = average(Value2,length);   

plot1(Value4 - Value3, "力道");  
