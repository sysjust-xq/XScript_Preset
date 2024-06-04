{@type:indicator|@guid:9ec804a756064c62a42eddd0148aff65|@path:/技術指標/上漲天數指標|@hash:9c26f19462c4b1f26844c37661137530}
input:count1(20);
input:count2(10);

value1=countif(close>close[1],count1);
value2=countif(close>close[1],count2);
value3=value1-value2;

plot1(value1);
plot2(value2);
plot3(value3);