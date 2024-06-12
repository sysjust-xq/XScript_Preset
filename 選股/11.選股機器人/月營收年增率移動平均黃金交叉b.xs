{@type:filter}
value1=GetField("月營收年增率","M");

if average(value1,4) crosses over average(value1,12)
and value1 > 0
then ret=1;

outputfield(1,value1,2,"月營收年增率%", order := 1);
