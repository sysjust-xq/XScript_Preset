{@type:filter|@guid:52e8e2fca52843f9afc342e505b69c81|@path:/06.籌碼選股/交易家數暴增}
value1=GetField("分公司交易家數","D");
value2=highest(GetField("分公司交易家數","D")[1],20);
if value1-value2>150
then ret=1;