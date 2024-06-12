{@type:indicator}
input:period(10,"計算天期");

if barfreq <> "D" then raiseruntimeerror("不支援此頻率");

value1=GetField("強弱指標");
value2=countif(value1>1,period);
value3=average(value2,period);
linearreg(value3,period,0,value4,value5,value6,value7);

plot1(value4,"強度斜率");
 
 

