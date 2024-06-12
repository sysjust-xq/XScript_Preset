{@type:indicator}
input:period1(22,"MA天期");
input:period2(10,"差異MA天期");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

//狀況1.：如果 K線日期與交易家數相關資料欄位日期不同，並且成交量=0，則交易家數相關指標回傳0。
//狀況2.：如果 K線日期與交易家數相關資料欄位日期不同，並且成交量<>0，則交易家數相關指標正常運算。	
if getfieldDate("date") <> getfieldDate("分公司交易家數") and GetField("成交量") = 0 then value1 = 0 else value1=GetField("分公司交易家數");

value2=average(value1,period1);
value3=value1-value2;
value4=average(value3,period2);
plot1(value3,"分公司家數差");
plot2(value4,"家數差移動平均線");