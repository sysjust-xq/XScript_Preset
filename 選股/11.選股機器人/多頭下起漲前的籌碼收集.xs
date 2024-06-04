{@type:filter|@guid:9e21af69828c411a98aeb5c0b35f3aac|@path:/11.選股機器人/多頭下起漲前的籌碼收集}
setbarfreq("AD");

value1=GetField("分公司買進家數");
value2=GetField("分公司賣出家數");
value3=value2-value1;
value4=countif(value3>20,10);
if value4>6 and close[30]>close*1.1
then ret=1;

outputfield(1,value1,0,"買進家數", order := -1);
outputfield(2,value2,0,"賣出家數");
