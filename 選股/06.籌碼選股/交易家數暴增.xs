{@type:filter}
value1=GetField("分公司交易家數","D");
value2=highest(GetField("分公司交易家數","D")[1],20);
if value1-value2>150
then ret=1;