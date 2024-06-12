{@type:function}
input:period(numericsimple);
value1=GetField("股本(億)")*10000;
value2=average(volume,period);
if value1<>0
then value3=value2/value1*100;
turnoverrate=value3;

