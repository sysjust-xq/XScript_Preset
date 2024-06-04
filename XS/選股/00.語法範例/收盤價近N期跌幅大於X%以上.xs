{@type:filter|@guid:9898c5cb26c54cfe96c6c81a2533f2e6|@path:/00.語法範例/收盤價近N期跌幅大於X%以上}
input:N(10);	SetInputName(1, "期別");
input:X(5); 	SetInputName(2, "跌幅%");

SetTotalBar(3); 

Value1 = RateOfChange(GetField("收盤價"),N);
if Value1 < -1 * X then ret=1;
 
SetOutputName1("近期跌幅%"); 
OutputField1(Value1); 