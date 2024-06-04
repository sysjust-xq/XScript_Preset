{@type:filter|@guid:cd8b90795ba541e2959d4637c15df61f|@path:/07.月營收選股/月營收出現死亡交叉}
input:shortterm(4);
input:longterm(12);
setinputname(1,"短期均線");
setinputname(2,"長期均線");

if average(GetField("月營收","M"),shortterm)*1.1
< average(GetField("月營收","M"),longterm)
then ret=1;
