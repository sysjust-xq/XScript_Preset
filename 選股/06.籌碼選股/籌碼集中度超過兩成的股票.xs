{@type:filter}
input:day(10,"天數");
input:ratio(20,"最低百分比");
setbarfreq("D");
settotalbar(day+3);

value1=GetField("主力買賣超張數","D");

if volume<>0 then 
	value2=summation(value1,day)/summation(volume,day)*100;
if value2>=ratio then 
	ret=1;
	
outputfield(1,value2,0,"籌碼集中度");
