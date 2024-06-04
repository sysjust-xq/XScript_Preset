{@type:function|@guid:269d51cbd0a6408ba14995f738941223|@path:/技術指標/TurnOverRate}
input:period(numericsimple);
value1=GetField("股本(億)")*10000;
value2=average(volume,period);
if value1<>0
then value3=value2/value1*100;
turnoverrate=value3;

