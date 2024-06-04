{@type:filter|@guid:174a673d187548039ac4f7fbe0062c60|@path:/07.月營收選股/月營收年增率移動平均黃金交叉}
value1=GetField("月營收年增率","M");

if average(value1,4) crosses over average(value1,12)
and value1 > 0
then ret=1;

outputfield(1,value1,2,"月營收年增率%", order := 1);
