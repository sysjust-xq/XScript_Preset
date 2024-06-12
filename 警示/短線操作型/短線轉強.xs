{@type:sensor}
input:day(66,"移動平均天數");
input:ratio(30,"超出均值比率");
variable:count(0);

//透過Z的時間安排來決定現在用的是那一根Bar的資料 
variable: Z(0);
if currenttime > 180000 
or currenttime < 083000 then 
	Z =0 
else 
	Z=1;

value1=GetField("法人買張")[Z]; value2=average(value1,day);
value3=GetField("強弱指標")[Z]; value4=average(value3,day);
value5=GetField("外盤均量")[Z]; value6=average(value5,day);
value7=GetField("主動買力")[Z]; value8=average(value7,day);
value9=GetField("開盤委買"); value10=average(value9,day);
 
count=0;
if value1>=value2*(1+ratio/100) then count=count+1;
if value3>=value4*(1+ratio/100) then count=count+1;
if value5>=value6*(1+ratio/100) then count=count+1;
if value7>=value8*(1+ratio/100) then count=count+1;
if value9>=value10*(1+ratio/100) then count=count+1;
 
if count>=4 and close<lowest(close,day)*1.1
and GetSymbolField("tse.tw","收盤價","D")>average(GetSymbolField("tse.tw","收盤價","D"),10)
and average(volume,200)>2000
then ret=1;
