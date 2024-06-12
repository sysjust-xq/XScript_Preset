{@type:filter}
input:N(4); setinputname(1, "期別");
input:X(1); setinputname(2, "元"); 

SetTotalBar(3); 

if TrueAll(GetField("EPS", "Y") > X,N) then ret=1; 

SetOutputName1("EPS(元)(年)"); 
OutputField1(GetField("EPS", "Y")); 
