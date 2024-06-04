{@type:filter|@guid:50ad77a5400b49769e47b9e0486d34b7|@path:/00.語法範例/最近4季EPS合計小於X元}
input:X(0); SetInputName(1, "元");

variable: N(4);

SetTotalBar(3); 

Value1 = Summation(GetField("EPS","Q"),N);
if Value1 < X then ret=1; 

SetOutputName1("EPS合計"); 
OutputField1(Value1); 
