{@type:filter|@guid:b4e501e81165420aa39178bf961a2fb0|@path:/00.語法範例/股價大於近N期平均}
input:N(5); setinputname(1, "期別"); 

SetTotalBar(3);

Value1 = Average(GetField("Close"),N);
if GetField("Close") > Average(GetField("Close"),N) then ret=1; 

SetOutputName1("均價");
outputfield1(Value1);

