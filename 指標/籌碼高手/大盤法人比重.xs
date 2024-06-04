{@type:indicator|@guid:d65894dd5d4047adbdc5f91a47079951|@path:/籌碼高手/大盤法人比重|@hash:ed001bd3f95ccabcaf3cb9779f6c76d1}
condition994 = symbol = "TSE.TW" or symbol = "TWSE.FS" or symbol = "OTC.TW";//大盤

if condition994 = false //大盤
	then raiseruntimeerror("不支援此商品");

if barfreq <> "D" and barfreq <> "AD" and
	barfreq <> "W" and barfreq <> "AW" and
	barfreq <> "M" and barfreq <> "AM"
	then raiseruntimeerror("不支援此頻率");
	
plot1(0.005*(GetField("法人買進比重")+GetField("法人賣出比重")),"交易比重",checkbox:=1,axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);
plot2(0.01*GetField("法人買進比重"),"買進比重",checkbox:=0,axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);
plot3(0.01*GetField("法人賣出比重"),"賣出比重",checkbox:=0,axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);