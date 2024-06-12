{@type:filter}
input:period(60,"計算區間");
setbarfreq("D");
settotalbar(period);

value1=GetField("分公司買進家數","D");
value2=GetField("分公司賣出家數","D");
condition1=false;
if countif(value1<value2,period)>period/2
then condition1=true;

if condition1
and close>open*1.035
and GetField("主力買賣超張數","D")>0
and summation(GetField("主力買賣超張數","D"),5)>0
and summation(GetField("主力買賣超張數","D"),20)>0
and summation(GetField("主力買賣超張數","D"),60)>0
and summation(GetField("主力買賣超張數","D"),120)>0
then ret=1;

