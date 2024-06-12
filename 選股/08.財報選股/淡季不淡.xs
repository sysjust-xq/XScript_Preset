{@type:filter}
input:r1(5);	setinputname(1,"過去幾年月營收單月衰退幅度下限(%)");
input:r2(0);	setinputname(2,"最近一個月營收月增率下限(%)");
//input:TXT("僅適用月線"); setinputname(3,"使用限制");
setbarfreq("M");

If barfreq <> "M" then raiseruntimeerror("頻率設定有誤");

settotalbar(3);

value1=GetField("月營收月增率","M");
value2=GetField("月營收月增率","M")[12];
value3=GetField("月營收月增率","M")[24];
value4=GetField("月營收月增率","M")[36];

if value2 < -r1 and value3 < -r1 and value4 < -r1 and value1 > r2
then ret=1;




