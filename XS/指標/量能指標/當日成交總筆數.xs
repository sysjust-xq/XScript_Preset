{@type:indicator|@guid:c9ef029cd09b423ebb7b149b4ce85b39|@path:/量能指標/當日成交總筆數|@hash:a9a1dbe7ebd2889dbebf59c1b535d5aa}
input:p1(5,"短天期");
input:p2(20,"長天期");

value1=GetField("總成交次數");
value2=average(value1,p1);
value3=average(value2,p2);

plot1(value2,"成交筆數短期均線");
plot2(value3,"成交筆數長期均線");







