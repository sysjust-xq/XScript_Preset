{@type:filter|@guid:131a715d644d45aa8f8c9a97c35b3cc8|@path:/00.語法範例/EPS連續N季成長}
input:N(4); SetInputName(1, "期別");
 
SetTotalBar(3); 

if TrueAll(GetField("EPS","Q") > GetField("EPS","Q")[1],N) then ret=1; 

SetOutputName1("EPS(元)(季)"); 
OutputField1(GetField("EPS","Q")); 
