{@type:filter}
input:N(10);	SetInputName(1, "期別");
input:X(5); 	SetInputName(2, "漲幅%");

SetTotalBar(3); 

Value1 = RateOfChange(GetField("收盤價"),N);
if Value1 > X then ret=1;
 
SetOutputName1("近期漲幅%"); 
OutputField1(Value1); 