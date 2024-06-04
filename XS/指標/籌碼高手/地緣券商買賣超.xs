{@type:indicator|@guid:12e612ce6ea6432c9f2375ae870fbd9f|@path:/籌碼高手/地緣券商買賣超|@hash:56577ca29ee67a886bc33ad4b74b4de9}
condition999 = symbolexchange = "TW";//台股

if condition999 = false //個股
	then raiseruntimeerror("不支援此商品");

if barfreq <> "D" and barfreq <> "AD"
	then raiseruntimeerror("不支援此頻率");

value1 = GetField("地緣券商買賣超張數");
value2 += value1;
plot1(value1,"買賣超",checkbox:=1,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sd0); //bar，axis2
plot2(value2,"地緣券商累計買賣超",checkbox:=1,axis:=1,ScaleLabel:=sltypewy,ScaleDecimal:=sd0); //line，axis1

