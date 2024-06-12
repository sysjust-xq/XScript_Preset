{@type:sensor}
if barfreq<> "Min"and barinterval<> 5 then raiseruntimeerror("本腳本只限五分鐘線");

condition1 = GetSymbolField("tse.tw","收盤價","D") > average(GetSymbolField("tse.tw","收盤價","D"),10);
//多頭市場

condition2 = GetSymbolField("tse.tw","收盤價","D") / GetSymbolField("tse.tw","收盤價","D")[2]+0.01
			  <  GetField("收盤價","D")/GetField("收盤價","D")[2];
//前兩日比大盤明顯走強

condition3 = GetField("收盤價","D")[1] <GetField("收盤價","D")[10]*1.07;
//近十日沒有漲的太兇

condition4 = Average(GetField("Volume", "D")[1], 100) >= 1000;

if condition1 and condition2 and condition3 and condition4 then begin
	if time=091500
	and trueall(close>close[1],3)
	//開盤三根五分鐘線都是紅棒
	and average(volume,3)>average(volume,20)*1.3
	//開盤的量能明顯增加
	and GetField("收盤價","D")[1]<GetField("收盤價","D")[2]
	then ret=1;
end;

