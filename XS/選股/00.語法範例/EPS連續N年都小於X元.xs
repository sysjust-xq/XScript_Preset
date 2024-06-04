{@type:filter|@guid:c6c29031236e4001ad252a37ab7ac3d7|@path:/00.語法範例/EPS連續N年都小於X元}
input:N(4); setinputname(1, "期別");
input:X(0); setinputname(2, "元"); 

SetTotalBar(3); 

if TrueAll(GetField("EPS", "Y") < X,N) then ret=1; 

SetOutputName1("EPS(元)(年)"); 
OutputField1(GetField("EPS", "Y")); 
