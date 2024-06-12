{@type:filter}
input:shortterm(4);
input:longterm(12);
setinputname(1,"短期均線");
setinputname(2,"長期均線");

if average(GetField("月營收","M"),shortterm)*1.1
< average(GetField("月營收","M"),longterm)
then ret=1;
