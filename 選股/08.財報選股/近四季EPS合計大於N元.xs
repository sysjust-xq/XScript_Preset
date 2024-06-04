{@type:filter|@guid:098f8b819a3148be94079eb5acdcd00e|@path:/08.財報選股/近四季EPS合計大於N元}
input:n1(3);
setinputname(1,"每股稅後淨利最低標準");
value1=GetField("每股稅後淨利(元)","Q");
value2=summation(value1,4);
if value2>=n1
then ret=1;
