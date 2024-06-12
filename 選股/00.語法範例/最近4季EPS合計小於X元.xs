{@type:filter}
input:X(0); SetInputName(1, "元");

variable: N(4);

SetTotalBar(3); 

Value1 = Summation(GetField("EPS","Q"),N);
if Value1 < X then ret=1; 

SetOutputName1("EPS合計"); 
OutputField1(Value1); 
