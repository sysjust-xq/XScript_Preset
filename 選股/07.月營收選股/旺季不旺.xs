{@type:filter}
input:r1(5,"過去幾年月營收單月成長幅度下限%");
setbarfreq("M");
settotalbar(3);

value1=GetField("月營收月增率","M");
value2=GetField("月營收月增率","M")[12];
value3=GetField("月營收月增率","M")[24];
value4=GetField("月營收月增率","M")[36];

value5=(value2+value3+value4)/3;

if value2 > r1 and value3 > r1 and value4 > r1 and value1 < value5
then ret=1;
