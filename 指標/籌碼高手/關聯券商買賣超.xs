{@type:indicator|@guid:74e151db0eaf450eb4cd47ae0fff68ba|@path:/籌碼高手/關聯券商買賣超|@hash:0e0e699c1c95733be0886ef5615ed326}
condition999 = symbolexchange = "TW";//台股
condition998 = symbolType = 2;//股票

if condition999 = false or condition998 = false//個股
	then raiseruntimeerror("不支援此商品");

if barfreq <> "D" and barfreq <> "AD"
	then raiseruntimeerror("不支援此頻率");

value1 = GetField("關聯券商買賣超張數");
value2 += value1;
plot1(value1,"買賣超(張)",checkbox:=1,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sd0); //bar，axis2
plot2(value2,"累計買賣超(張)",checkbox:=1,axis:=1,ScaleLabel:=sltypewy,ScaleDecimal:=sd0); //line，axis1