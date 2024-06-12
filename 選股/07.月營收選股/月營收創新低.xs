{@type:filter}
input:period(36, "期別");
settotalbar(period + 5);

value1=GetField("月營收","M");
value2=lowest(GetField("月營收","M"),period);

if value1=value2
and value1[1]=value2[1]
then ret=1;

outputfield(1, value1,2,"月營收(億)", order := 1);



