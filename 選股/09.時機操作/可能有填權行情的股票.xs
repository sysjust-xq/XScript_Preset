{@type:filter}
value1=GetField("除權日期");
value2=GetField("每股稅後淨利(元)","Y");
if value1>date
and datediff(value1,date)<5
//除權後五天內
and trueall(close<close[1]*1.02,3)
//除權前後未大漲
and value2>=2
//每股稅後淨利大於2元
then ret=1;
outputfield(1,value1,0,"今年度除權日");
