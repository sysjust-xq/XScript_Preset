{@type:indicator|@guid:33bd2fb7d48a48b69429e7c26a246f8c|@path:/技術指標/多空力道指標|@hash:921c886087b3ccc9df63c833af99a39d}
input: length(5);	setinputname(1, "天期");

Value1 = high - close;   
Value2 = close - low; 

Value3 = average(Value1,length);   
Value4 = average(Value2,length);   

plot1(Value4 - Value3, "力道");  
