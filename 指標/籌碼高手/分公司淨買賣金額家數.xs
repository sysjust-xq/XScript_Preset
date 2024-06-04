{@type:indicator|@guid:381a9f1edbd9493d854b12d3c1ad82da|@path:/籌碼高手/分公司淨買賣金額家數|@hash:f4d9731dad574fcd55a24975c1ca4223}
condition999 = symbolexchange = "TW" or symbolexchange = "TE";//台股+興櫃
condition997 = condition999 and (symboltype = 2 or symboltype = 4 or symbolType = 1);//個股+權證+興櫃+類股

if condition997 = false //個股+權證+興櫃+類股
	then raiseruntimeerror("不支援此商品");

if barfreq <> "D" and barfreq <> "AD" 
	then raiseruntimeerror("不支援此頻率");

//狀況1.：如果 K線日期與交易家數相關資料欄位日期不同，並且成交量=0，則交易家數相關指標回傳0。
//狀況2.：如果 K線日期與交易家數相關資料欄位日期不同，並且成交量<>0，則交易家數相關指標正常運算。
if getfieldDate("date") <> getfieldDate("分公司淨買超金額家數") and GetField("成交量") = 0 then value1 = 0 else value1 = GetField("分公司淨買超金額家數");
if getfieldDate("date") <> getfieldDate("分公司淨賣超金額家數") and GetField("成交量") = 0 then value2 = 0 else value2 = GetField("分公司淨賣超金額家數");

plot1(value2-value1,"分公司淨買賣超金額家數差",checkbox:=1,axis:=2,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位：家
plot2(value1,"分公司淨買超金額家數",checkbox:=0,axis:=1,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位：家，可勾選畫圖選項 (參數設定) 
plot3(value2,"分公司淨賣超金額家數",checkbox:=0,axis:=1,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位：家，可勾選畫圖選項 (參數設定) 