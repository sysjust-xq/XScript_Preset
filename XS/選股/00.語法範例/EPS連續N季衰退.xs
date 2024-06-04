{@type:filter|@guid:bfc890ba90504a41a4244c6602bf3844|@path:/00.語法範例/EPS連續N季衰退}
input:N(4); SetInputName(1, "期別");
 
SetTotalBar(3); 

if TrueAll(GetField("EPS","Q") < GetField("EPS","Q")[1],N) then ret=1; 

SetOutputName1("EPS(元)(季)"); 
OutputField1(GetField("EPS","Q")); 
