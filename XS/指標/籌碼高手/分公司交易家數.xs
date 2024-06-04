{@type:indicator|@guid:d6c54703775a460a90439a811347d382|@path:/籌碼高手/分公司交易家數|@hash:664941dd003f01eda618ded554a389aa}
condition999 = symbolexchange = "TW" or symbolexchange = "TE";//台股+興櫃
condition997 = condition999 and (symboltype = 2 or symboltype = 4);//個股+權證+興櫃

if condition997 = false //個股+權證+興櫃
	then raiseruntimeerror("不支援此商品");

if barfreq <> "D" and barfreq <> "AD" 
	then raiseruntimeerror("不支援此頻率");

//狀況1.：如果 K線日期與交易家數相關資料欄位日期不同，並且成交量=0，則交易家數相關指標回傳0。
//狀況2.：如果 K線日期與交易家數相關資料欄位日期不同，並且成交量<>0，則交易家數相關指標正常運算。
if getfieldDate("date") <> getfieldDate("分公司交易家數") and GetField("成交量") = 0 then value11 = 0 else value11 = GetField("分公司交易家數");
if getfieldDate("date") <> getfieldDate("分公司買進家數") and GetField("成交量") = 0 then value21 = 0 else value21 = GetField("分公司買進家數");
if getfieldDate("date") <> getfieldDate("分公司賣出家數") and GetField("成交量") = 0 then value31 = 0 else value31 = GetField("分公司賣出家數");
if GetField("市場總分點數") <> 0 then value1 = value11/GetField("市場總分點數");
plot1(value11,"交易家數",checkbox:=1,axis:=1,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位：家
plot2(value1,"參與率",checkbox:=0,axis:=2,ScaleLabel:=slpercent,ScaleDecimal:=sd2);
plot3(value21,"買進家數",checkbox:=0,axis:=1,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位：家，可勾選畫圖選項 (參數設定) 
plot4(value31,"賣出家數",checkbox:=0,axis:=1,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位：家，可勾選畫圖選項 (參數設定)