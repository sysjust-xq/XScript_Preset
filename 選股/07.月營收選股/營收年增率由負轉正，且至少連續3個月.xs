{@type:filter|@guid:1ac5d23d2a69411e94ce243ef8d4157e|@path:/07.月營收選股/營收年增率由負轉正，且至少連續3個月}
value1=GetField("月營收年增率","M");
input:period(3);
if trueall(value1>0,period) and value1[3]<0
then ret=1;