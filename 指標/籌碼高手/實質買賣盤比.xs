{@type:indicator}
condition996 = symbolexchange = "TW" and symboltype = 2;//個股
condition994 = symbol = "TSE.TW" or symbol = "TWSE.FS" or symbol = "OTC.TW";//大盤
condition993 = symbolexchange = "TW" and symboltype = 1;//類股

if condition994 =false and condition993 = false and condition996 = false //大盤+類股+個股
	then raiseruntimeerror("不支援此商品");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

plot1(0.01*(GetField("實質買盤比")-GetField("實質賣盤比")),"買賣差值",checkbox:=1,axis:=2,ScaleLabel:=slpercent,ScaleDecimal:=sd2);
plot2(0.01*GetField("實質買盤比"),"買盤比",checkbox:=0,axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);
plot3(0.01*GetField("實質賣盤比"),"賣盤比",checkbox:=0,axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);