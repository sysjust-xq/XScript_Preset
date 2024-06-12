{@type:indicator}
value1=GetField("上漲家數");
value2=GetField("下跌家數");
value3=value1+value2;
if value3 = 0 then value4 = 0 else value4=value1/value3*100;

plot1(value4,"上漲佔比");

