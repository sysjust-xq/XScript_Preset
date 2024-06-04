{@type:filter|@guid:d1246a8ae1b74613b651012e074813d1|@path:/00.語法範例/股價小於近N期平均}
input:N(5); setinputname(1, "期別"); 

SetTotalBar(3);

Value1 = Average(GetField("Close"),N);
if GetField("Close") < Value1 then ret=1; 

SetOutputName1("均價");
outputfield1(Value1);

