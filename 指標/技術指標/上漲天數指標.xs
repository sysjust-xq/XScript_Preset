{@type:indicator}
input:count1(20);
input:count2(10);

value1=countif(close>close[1],count1);
value2=countif(close>close[1],count2);
value3=value1-value2;

plot1(value1);
plot2(value2);
plot3(value3);