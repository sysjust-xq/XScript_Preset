{@type:indicator}
input:period(10,"移動平均線天期");
value1=average(ado,period);
plot1(value1,"ado聚散擺盪平均線");