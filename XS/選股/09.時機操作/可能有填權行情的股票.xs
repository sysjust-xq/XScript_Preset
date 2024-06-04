{@type:filter|@guid:79a0a6d9c872459c9c7736c32ff0f3d4|@path:/09.時機操作/可能有填權行情的股票}
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
