{@type:indicator|@guid:a352d8bfffa7493282ded046a4a0d5bd|@path:/大盤指標/內外盤量差|@hash:97a1c8193e9f56b3541625387e304eb9}
{
指標說明
https://xstrader.net/內外盤量比在預測大盤後市上的應用/
收錄於「三週學會程式交易：打造你的第一筆自動化交易」242頁
https://www.ipci.com.tw/books_in.php?book_id=724
}

if barfreq = "Tick" or barfreq = "Min" then 
begin
	value1=GetField("內盤量");//單位:元
	value2=GetField("外盤量");//單位:元
end else begin
	value1=GetField("內盤量","D");//單位:元
	value2=GetField("外盤量","D");//單位:元
end;

if volume <> 0 then begin
	value3=value2/volume*100;//外盤量比
	value4=value1/volume*100;//內盤量比
end else begin
	value3=value3[1];
	value4=value4[1];
end;

value5=average(value3,5);
value6=average(value4,5);
value7=value5-value6+5;
plot1(value7,"內外盤量比差");



