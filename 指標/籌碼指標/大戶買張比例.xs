{@type:indicator}
input:period1(5,"短移動平均線天期");
input:period2(20,"長移動平均線天期");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");
	
value1=GetField("主力買張");
value2=GetField("實戶買張");
value3=GetField("散戶買張");
value4=GetField("控盤者買張");
value5=GetField("法人買張");
value6=value1+value2+value3+value4+value5;
//合計的買張數當分母，這有可能超出成交量
value7=value1+value4+value5;
//主力+法人+控盤者的買張合計作為大戶的買張
if value6<>0 then
	value8=value7/value6*100;
//計算大戶買張佔各方勢力買張的比例
value9=average(value8,period1)-average(value8,period2);
plot1(value9,"大戶買張比例");
