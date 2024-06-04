{@type:filter|@guid:eabc6b32f3d64b02aad90c9b3bb17dac|@path:/04.價量選股/站在五十二週高點之上}
value1=GetField("最高價","w");
value2=highest(value1[1],52);
if close>value2 then ret=1;