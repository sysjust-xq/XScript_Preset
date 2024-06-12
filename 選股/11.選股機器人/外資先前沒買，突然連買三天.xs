{@type:filter}
setbarfreq("AD");

input: _period(20, "期間");
input: _ratio(5, "買超占成交比重");

condition1 = trueall(GetField("外資買賣超","D")[3]=0, _period);
condition2 = trueall(GetField("外資買賣超","D")*100/volume>=_ratio,3);

if condition1 and condition2 
then ret=1;

value1 = Summation(GetField("外資買賣超","D"), 3) / Summation(Volume, 3) * 100;
outputfield(1,value1,2,"外資買超%", order := 1);
