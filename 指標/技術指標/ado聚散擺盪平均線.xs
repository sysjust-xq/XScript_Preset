{@type:indicator|@guid:a294dfe823944f5cab606b45a0e4f181|@path:/技術指標/ado聚散擺盪平均線|@hash:72028bd8e46d84c190145cbae792ec39}
input:period(10,"移動平均線天期");
value1=average(ado,period);
plot1(value1,"ado聚散擺盪平均線");