{@type:indicator|@guid:ec9bfb113b43440c85ab036f117dbd8d|@path:/大盤指標/委買委賣均張差額|@hash:5c8a6514658d9197e4753207d49ed9f9}
{
指標說明
收錄於「三週學會程式交易：打造你的第一筆自動化交易」 246頁
https://www.ipci.com.tw/books_in.php?book_id=724
}

input:period(10,"天數");

if barfreq = "Tick" or barfreq = "Min" then begin
	value1=GetField("委買均");
	value2=GetField("委賣均");
end else begin
	value1=GetField("委買均","D");
	value2=GetField("委賣均","D");
end;
	
	
value3=value1-value2;
value4=average(value3,period);
 
plot1(value4,"委買賣均張差額的移動平均");
