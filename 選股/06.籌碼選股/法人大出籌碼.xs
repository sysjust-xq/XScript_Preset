{@type:filter}
input:r1(45);
setinputname(1,"法人賣出佔成交量比例下限%");
value1=GetField("外資賣張","D");
value2=GetField("投信賣張","D");
value3=GetField("自營商賣張","D");
if volume<>0 then 
value4=(value1+value2+value3)/volume;
if value4*100>r1
then ret=1;