{@type:indicator}
condition999 = symbolexchange = "TW" or symbolexchange = "TE";//台股+興櫃
condition992 = condition999 and  (symbol <> "TSE.TW" and symbol <> "TWSE.FS" and symbol <> "OTC.TW");//類股+個股+權證+興櫃

if condition992 = false //類股+個股+權證+興櫃
	then raiseruntimeerror("不支援此商品");

if barfreq <> "D" and barfreq <> "AD" 
	then raiseruntimeerror("不支援此頻率");

//狀況1.：如果 K線日期與交易家數相關資料欄位日期不同，並且成交量=0，則交易家數相關指標回傳0。
//狀況2.：如果 K線日期與交易家數相關資料欄位日期不同，並且成交量<>0，則交易家數相關指標正常運算。
if getfieldDate("date") <> getfieldDate("分公司買進家數") and GetField("成交量") = 0 then value1 = 0 else value1 = GetField("分公司買進家數");
if getfieldDate("date") <> getfieldDate("分公司賣出家數") and GetField("成交量") = 0 then value2 = 0 else value2 = GetField("分公司賣出家數");

plot1(value2-value1,"家數差",checkbox:=1,axis:=2);//單位：家
plot2(value1,"買進",checkbox:=0,axis:=1);//單位：家，可勾選畫圖選項 (參數設定) 
plot3(value2,"賣出",checkbox:=0,axis:=1);//單位：家，可勾選畫圖選項 (參數設定) 