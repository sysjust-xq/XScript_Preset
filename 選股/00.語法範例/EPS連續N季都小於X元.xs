{@type:filter|@guid:17d4313cf9e4413dbcd6b989cfb6611c|@path:/00.語法範例/EPS連續N季都小於X元}
input:N(4); setinputname(1, "期別");
input:X(0); setinputname(2, "元"); 

SetTotalBar(3); 

if TrueAll(GetField("EPS", "Q") < X,N) then ret=1; 

SetOutputName1("EPS(元)(季)"); 
OutputField1(GetField("EPS", "Q")); 
