{@type:filter|@guid:760dcf3c4e034747b640a4913243ba92|@path:/00.語法範例/EPS連續N年都大於X元}
input:N(4); setinputname(1, "期別");
input:X(1); setinputname(2, "元"); 

SetTotalBar(3); 

if TrueAll(GetField("EPS", "Y") > X,N) then ret=1; 

SetOutputName1("EPS(元)(年)"); 
OutputField1(GetField("EPS", "Y")); 
