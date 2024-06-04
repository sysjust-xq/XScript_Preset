{@type:filter|@guid:919fcd68c59645f0b04910cb0b482244|@path:/07.月營收選股/月營收創新高股價離高點有些距離}
value1=highest(getfield("月營收","M"),48);
value2=highest(GetField("總市值","D"),500);

if getfield("月營收","M")=value1
and value2>GetField("總市值","D")*1.2
then ret=1;