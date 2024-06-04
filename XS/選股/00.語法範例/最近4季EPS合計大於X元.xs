{@type:filter|@guid:e1967bb93bc84feeacb7752644105485|@path:/00.語法範例/最近4季EPS合計大於X元}
input:X(5); SetInputName(1, "元");

variable: N(4);

SetTotalBar(3); 

Value1 = Summation(GetField("EPS","Q"),N);
if Value1 > X then ret=1; 

SetOutputName1("EPS合計"); 
OutputField1(Value1); 
