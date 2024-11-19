{@type:indicator}
{指標數值定義：(外盤)量 = 開盤累計到目前的(外盤)成交量

支援商品：台股/期貨/選擇權}

value91 = GetField("外盤量");

value1 = GetField("外盤量","D");
value2 = GetField("內盤量","D");
value3 = value1 - value2;
plot1(value3,"買賣力");
plot2(value1,"外盤量",checkbox:=0);
plot3(value2,"內盤量",checkbox:=0);