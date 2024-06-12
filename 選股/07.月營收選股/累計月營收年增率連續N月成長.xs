{@type:filter}
input:period(6,"計算區間");
settotalbar(period+1);
value1=GetField("累計營收年增率","M");
if trueall(value1>value1[1],period)
then ret=1;
