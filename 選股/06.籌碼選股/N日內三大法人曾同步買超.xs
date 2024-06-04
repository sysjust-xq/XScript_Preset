{@type:filter|@guid:d1d3f08a77b84e80902d347f41bc9c87|@path:/06.籌碼選股/N日內三大法人曾同步買超}
input:days(20,"計算天期");
setbarfreq("D");
settotalbar(days+1);

value1=GetField("外資買賣超","D");
value2=GetField("投信買賣超","D");
value3=GetField("自營商自行買賣買賣超","D");
condition1=value1>0 and value2>0 and value3>0;
if barslast(condition1)<days
then ret=1;