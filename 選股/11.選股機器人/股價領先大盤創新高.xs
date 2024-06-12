{@type:filter}
input: Length(20, "布林通道天數");
input: BandRange(2, "上下寬度");
variable: up(0);

Condition1 = GetSymbolField("TSE.TW","收盤價","D") > average(GetSymbolField("TSE.TW","收盤價","D"),10);
Condition2 = average(GetSymbolField("TSE.TW","收盤價","D"),5) > average(GetSymbolField("TSE.TW","收盤價","D"),20);

value1=close/GetSymbolField("TSE.TW","收盤價","D");
up = bollingerband(value1, Length, BandRange);
Condition3 = TrueAll(value1 >= up, 3);

// 成交量判斷
Condition99 = Average(Volume[1], 100) >= 1000;

if Condition1 And Condition2 And Condition3 And Condition99 then ret=1;

outputfield(1, rateofchange(c,5), 2, "5日漲幅%", order := 1);
outputfield(2, rateofchange(GetSymbolField("TSE.TW","收盤價","D"),5), 2, "大盤5日漲幅%");
