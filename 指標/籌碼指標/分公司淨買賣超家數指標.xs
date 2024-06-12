{@type:indicator}
if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

//狀況1.：如果 K線日期與交易家數相關資料欄位日期不同，並且成交量=0，則交易家數相關指標回傳0。
//狀況2.：如果 K線日期與交易家數相關資料欄位日期不同，並且成交量<>0，則交易家數相關指標正常運算。
if getfieldDate("date") <> getfieldDate("分公司淨買超金額家數") and GetField("成交量") = 0 then value1 = 0 else value1 = GetField("分公司淨買超金額家數");
if getfieldDate("date") <> getfieldDate("分公司淨賣超金額家數") and GetField("成交量") = 0 then value2 = 0 else value2 = GetField("分公司淨賣超金額家數");

value3=value2-value1;

plot1(value3,"家數差");
