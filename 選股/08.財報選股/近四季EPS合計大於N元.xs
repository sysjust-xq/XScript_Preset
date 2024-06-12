{@type:filter}
input:n1(3);
setinputname(1,"每股稅後淨利最低標準");
value1=GetField("每股稅後淨利(元)","Q");
value2=summation(value1,4);
if value2>=n1
then ret=1;
