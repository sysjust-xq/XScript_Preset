{@type:filter|@guid:24eaa9c6c9ed42f2a5cec7fd70ed2952|@path:/07.月營收選股/累計營收年增率黃金交叉}
value1=GetField("累計營收年增率","M");
input: r1(3),r2(12);
setinputname(1,"短天期");
setinputname(2,"長天期");
if average(value1,r1) crosses over average(value1,r2)+5
and value1>10
then ret=1;
