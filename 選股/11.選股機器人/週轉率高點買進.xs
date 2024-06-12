{@type:filter}
setbarfreq("AD");

value1=GetField("成交金額");
value2=GetField("總成交次數","D");
if value2>0 then value3=value1/value2;

if value3=highest(value3,200)
and close>close[1]*1.025
and close[2]<close[12]*1.05
and volume>2000
then ret=1;

outputfield(1, GetField("週轉率","D"), 2, "週轉率%", order := 1);
