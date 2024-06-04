{@type:filter|@guid:0d0299c7dac746f99c4cf3906b24d239|@path:/07.月營收選股/營收月增率比歷年突出}
input:r1(5);		setinputname(1,"月營收月增幅與過往三年的數字增加百分比(%)");
//input:TXT("僅適用月線"); setinputname(2,"使用限制");
setbarfreq("M");

If barfreq <> "M" then raiseruntimeerror("頻率設定有誤");

value1 = GetField("月營收月增率","M");
value2 = average(GetField("月營收月增率","M"),3);
value3 = average(GetField("月營收月增率","M")[12],3);
value4 = average(GetField("月營收月增率","M")[24],3);
value5 = average(GetField("月營收月增率","M")[36],3);

value6 = (value3 + value4 + value5) / 3;
if (value2 - value6) > r1 then
ret = 1;

SetOutputName1("近3月月營收增幅平均");
OutputField1(value2);
