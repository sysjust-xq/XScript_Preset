{@type:filter}
input:N(5); setinputname(1, "期別"); 

SetTotalBar(3);

Value1 = Average(GetField("Close"),N);
if GetField("Close") > Average(GetField("Close"),N) then ret=1; 

SetOutputName1("均價");
outputfield1(Value1);

