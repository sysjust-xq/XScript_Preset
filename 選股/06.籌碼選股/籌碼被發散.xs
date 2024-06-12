{@type:filter}
setbarfreq("AD");

input:period(10, "天期");

value1=GetField("分公司賣出家數");
value2=GetField("分公司買進家數");

if linearregslope(value1,period)<0
//賣出的家數愈來愈少
and linearregslope(value2,period)>0
//買進的家數愈來愈多 
and value2>300
and close>close[period]*1.05
//但這段期間股價在漲
and close>close[1]*1.025
//今天又漲超過2.5%
then ret=1;

outputfield(1,value2,0,"買進家數", order := 1);
outputfield(2,value1,0,"賣出家數");

