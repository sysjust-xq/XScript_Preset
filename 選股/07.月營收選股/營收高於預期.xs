{@type:filter}
input: r1(10);		setinputname(1, "月營收年增率增加幅度下限(%)");
//input:TXT("僅適用月線"); setinputname(2,"使用限制");
setbarfreq("M");

If barfreq <> "M" then raiseruntimeerror("頻率設定有誤");

settotalbar(3);

value1=GetField("月營收年增率","M");
value2=average(GetField("月營收年增率","M")[1],3);
if value1-value2 > r1
then ret=1;

setoutputname1("月營收年增率(%)");
outputfield1(value1);

