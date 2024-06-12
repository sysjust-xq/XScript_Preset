{@type:indicator}
input:p1(5,"短天期");
input:p2(20,"長天期");

value1=GetField("總成交次數");
value2=average(value1,p1);
value3=average(value2,p2);

plot1(value2,"成交筆數短期均線");
plot2(value3,"成交筆數長期均線");







