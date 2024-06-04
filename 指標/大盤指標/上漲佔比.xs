{@type:indicator|@guid:6fd5827607b74045aadbad725b56ef1c|@path:/大盤指標/上漲佔比|@hash:69cdc3976a64bfd09614c5840779ca05}
value1=GetField("上漲家數");
value2=GetField("下跌家數");
value3=value1+value2;
if value3 = 0 then value4 = 0 else value4=value1/value3*100;

plot1(value4,"上漲佔比");

