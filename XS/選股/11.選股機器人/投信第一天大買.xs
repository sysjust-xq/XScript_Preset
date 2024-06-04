{@type:filter|@guid:4a421467470249a0ba1a12d81505432c|@path:/11.選股機器人/投信第一天大買}
setbarfreq("AD");

input: v1(500, "投信估計持股上限(張)");

value1=GetField("投信持股","D");
value2=GetField("投信買賣超","D");

if value1 < v1 and value2 > VOLUME*0.2
then ret=1;

outputfield(1,GetField("投信買賣超","D"),0,"投信買超", order := 1);
