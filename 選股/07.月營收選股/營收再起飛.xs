{@type:filter}
//input:TXT("僅適用月線"); setinputname(1,"使用限制");
setbarfreq("M");

If barfreq <> "M" then raiseruntimeerror("頻率設定有誤");

settotalbar(23);

value1=GetField("月營收年增率","M");
value2=average(GetField("月營收年增率","M"), 3);
value3=linearregslope(value2,20);
value4=linearregslope(value2,5);

if value3 < 0 and value4 crosses above 0
then ret=1;
