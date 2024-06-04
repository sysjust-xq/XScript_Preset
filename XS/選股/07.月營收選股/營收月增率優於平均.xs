{@type:filter|@guid:6622991c99404ac5aa83d63a0a650ff2|@path:/07.月營收選股/營收月增率優於平均}
value1=GetField("月營收月增率","M");
value2=average(GetField("月營收月增率","M"),36);
if value1>10
and value1>value2*1.3
then ret=1;