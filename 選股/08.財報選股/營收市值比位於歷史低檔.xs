{@type:filter}
input:period(60,"計算月數");
input:ratio(10,"距離低點幅度");
setbarfreq("M");
settotalbar(period);

value1=GetField("總市值","M");//單位:億元
value2=GetField("月營收","M");//單位:億元
if value2<>0 then 
	value3=value1/value2
else
	value3=0;

if value3<lowest(value3,period)*(1+ratio/100)
//總市值營收比值距離過去一段時間最低點沒有差多遠
and value3>0
then ret=1;
outputfield(1,value3,2,"總市值/月營收");
outputfield(2,lowest(value3,period),2,"期間最低值");
outputfield(3,value3/lowest(value3,period),2,"兩者的比率");
