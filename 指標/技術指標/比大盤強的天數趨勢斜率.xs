{@type:indicator|@guid:9eadb7cde1d44ca69f60424a355b1c62|@path:/技術指標/比大盤強的天數趨勢斜率|@hash:d181851cf06a75a56916eae8dfb04e97}
input:period(10,"計算天期");

if barfreq <> "D" then raiseruntimeerror("不支援此頻率");

value1=GetField("強弱指標");
value2=countif(value1>1,period);
value3=average(value2,period);
linearreg(value3,period,0,value4,value5,value6,value7);

plot1(value4,"強度斜率");
 
 

