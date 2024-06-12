{@type:filter}
value1=highest(getfield("月營收","M"),48);
value2=highest(GetField("總市值","D"),500);

if getfield("月營收","M")=value1
and value2>GetField("總市值","D")*1.2
then ret=1;