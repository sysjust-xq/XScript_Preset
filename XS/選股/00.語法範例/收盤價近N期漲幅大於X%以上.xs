{@type:filter|@guid:8a00dff9366842d294cce5366fdcd6ca|@path:/00.語法範例/收盤價近N期漲幅大於X%以上}
input:N(10);	SetInputName(1, "期別");
input:X(5); 	SetInputName(2, "漲幅%");

SetTotalBar(3); 

Value1 = RateOfChange(GetField("收盤價"),N);
if Value1 > X then ret=1;
 
SetOutputName1("近期漲幅%"); 
OutputField1(Value1); 