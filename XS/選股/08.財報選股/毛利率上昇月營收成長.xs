{@type:filter|@guid:8de6352795a6493c9d5c1adc485bd32e|@path:/08.財報選股/毛利率上昇月營收成長}
value1=GetField("月營收月增率","M");
value2=GetField("營業毛利率","Q");
if value1>value1[1]
and value2>value2[1]
then ret=1;


 
 


