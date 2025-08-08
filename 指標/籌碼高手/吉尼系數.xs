{@type:indicator}
condition999 = symbolexchange = "TW" or symbolexchange = "TE";//台股+興櫃
condition998 = condition999 = true and symboltype = 2;//個股+興櫃

if condition998 = false //個股+興櫃
	then raiseruntimeerror("不支援此商品");

if barfreq <> "D" and barfreq <> "AD" 
	then raiseruntimeerror("不支援此頻率");

plot1(Getfield("吉尼係數","D"),"吉尼係數",axis:=1,ScaleLabel:=slfull,ScaleDecimal:=sd2);

//狀況1.：如果 K線日期與交易家數相關資料欄位日期不同，並且成交量=0，則交易家數相關指標回傳0。
//狀況2.：如果 K線日期與交易家數相關資料欄位日期不同，並且成交量<>0，則交易家數相關指標正常運算。	
if getfieldDate("date") <> getfieldDate("分公司交易家數") and GetField("成交量") = 0 then value1 = 0 else value1=GetField("分公司交易家數");
plot2(value1,"分公司交易家數",axis:=2,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位：家