{@type:indicator|@guid:7a2b6104684d437fa2175b2590594514|@path:/籌碼高手/關鍵券商買賣超|@hash:6a00f7bec950001c4cdc55d7dd81201b}
condition999 = symbolexchange = "TW";//台股

if condition999 = false //個股
	then raiseruntimeerror("不支援此商品");

if barfreq <> "D" and barfreq <> "AD"
	then raiseruntimeerror("不支援此頻率");

value1 = GetField("關鍵券商買賣超張數");
value2 += value1;
plot1(value1,"買賣超",checkbox:=1,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sd0); //bar，axis2
plot2(value2,"關鍵券商累計買賣超",checkbox:=1,axis:=1,ScaleLabel:=sltypewy,ScaleDecimal:=sd0); //line，axis1

