{@type:filter}
input:days(20,"計算天期");
setbarfreq("D");
settotalbar(days+1);

value1=GetField("外資買賣超","D");
value2=GetField("投信買賣超","D");
value3=GetField("自營商自行買賣買賣超","D");
condition1=value1>0 and value2>0 and value3>0;
if barslast(condition1)<days
then ret=1;