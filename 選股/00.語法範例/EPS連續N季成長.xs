{@type:filter}
input:N(4); SetInputName(1, "期別");
 
SetTotalBar(3); 

if TrueAll(GetField("EPS","Q") > GetField("EPS","Q")[1],N) then ret=1; 

SetOutputName1("EPS(元)(季)"); 
OutputField1(GetField("EPS","Q")); 
