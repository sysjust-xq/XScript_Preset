{@type:indicator}
{
指標說明
https://xstrader.net/進場點一目了然的大盤儀表板/
收錄於「三週學會程式交易：打造你的第一筆自動化交易」 260頁
https://www.ipci.com.tw/books_in.php?book_id=724
}

if barfreq <> "D" then raiseruntimeerror("不支援此頻率");

condition1=false;
condition2=false;
condition3=false;
condition4=false;
condition5=false;

//==========OTC 佔大盤成交量比================
value1=GetSymbolField("tse.tw","成交量");
value2=GetSymbolField("otc.tw","成交量");
value3=value2/value1*100;
value4=average(value3,5);
value5=low*0.98;
if value4 crosses over 20 then
	condition1=true;
if condition1 then
	plot1(value5,"OTC 進場訊號");

//============內外盤量比差====================
value6=GetField("內盤量");//單位:元
value7=GetField("外盤量");//單位:元
value8=value7/volume*100;//外盤量比
value9=value6/volume*100;//內盤量比
value10=average(value8,5);
value11=average(value9,5);
value7=value10-value11+5;
if value7 crosses over 0 then 
	condition2=true;
if condition2 then 
	plot2(value5*0.98,"內外盤量比差");

//===========上漲下跌家數 RSI 指標==============
input: _TEXT1("===============","上漲下跌家數RSI指標參數");
input:period(10,"RSI計算天數");
value12=GetField("上漲家數");
value13=GetField("下跌家數");
value14=value12-value13;
value15=summation(value14,period);
value16=rsi(value15,period);
if value16 crosses over 50 then
	condition3=true;
if condition3 then
	plot3(value5*0.97,"上漲下跌家數 RSI");

//===========上漲家數突破 200 檔================
value17=lowest(value12,5);
value18=average(value17,15);
if value18 crosses over 200 then
	condition4=true;
if condition4=true then
	plot4(value5*0.96,"上漲家數突破 200 家");

//==========上漲下跌量指標=====================
input: _TEXT2("===============","上漲下跌量指標參數");
input:p1(3,"上漲下跌量平均天數");
value19=GetField("上漲量");
value20=GetField("下跌量");
value21=average(value19,period);
value22=average(value20,period);
value23=value21-value22;
value24=average(value23,5);
if value24 crosses over 0 then
	condition5=true;
if condition5=true then
	plot5(value5*0.95,"上漲量突破下跌量");




