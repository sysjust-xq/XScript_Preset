{@type:indicator}
input: length(30);		setinputname(1, "天期");

value1=GetField("上漲家數");
value2=GetField("下跌家數");
value3=average(value1,length);
value4=average(value2,length);
if value4 <> 0 then value5=value3/value4;

plot1(value5, "尼古斯指標");