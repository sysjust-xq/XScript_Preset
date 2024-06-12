{@type:filter}
value1=GetField("最高價","w");
value2=highest(value1[1],52);
if close>value2 then ret=1;