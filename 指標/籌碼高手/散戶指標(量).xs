{@type:indicator}
condition996 = symbolexchange = "TW" and symboltype = 2;//個股
condition994 = symbol = "TSE.TW" or symbol = "TWSE.FS" or symbol = "OTC.TW";//大盤
condition993 = symbolexchange = "TW" and symboltype = 1;//類股

//原始spec要求支援類股，6.30暫不支援，等DB補資料
//if condition994 =false and condition993 = false and condition996 = false //大盤+類股+個股
if condition994 =false and condition996 = false //大盤+個股
	then raiseruntimeerror("不支援此商品");

if barfreq <> "D" and barfreq <> "AD"
	then raiseruntimeerror("不支援此頻率");

if condition994 then
	value1 =  GetField("累計成交") - (GetField("資券互抵張數") + GetField("現股當沖張數"))
else
	value1 = volume - (GetField("資券互抵張數") + GetField("現股當沖張數"));
value2 = GetField("融資買進張數") + GetField("融券買進張數");
value3 = GetField("融資賣出張數") + GetField("融券賣出張數");
if value1 <> 0 then begin
	value4 = value2 / value1;
	value5 = value3 / value1;
end else begin
	value4 = 0;
	value5 = 0;
end;

plot1(value4 - value5,"買賣差值",checkbox:=1,axis:=2,ScaleLabel:=slpercent,ScaleDecimal:=sd2);//單位：張
plot2(value4,"買進",checkbox:=0,axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);//單位：張
plot3(value5,"賣出",checkbox:=0,axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);//單位：張
