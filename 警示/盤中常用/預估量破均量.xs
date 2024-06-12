{@type:sensor}
value1=GetField("內盤量", "D");//當日內盤量
value2=GetField("外盤量", "D");//當日外盤量
if GetField("估計量") > average(volume[1],10)*1.3
and value2>value1
then ret=1;