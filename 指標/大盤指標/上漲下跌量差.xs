{@type:indicator}
{
指標說明
https://xstrader.net/進場點一目了然的大盤儀表板/
收錄於「三週學會程式交易：打造你的第一筆自動化交易」 244頁
https://www.ipci.com.tw/books_in.php?book_id=724
}

input:period1(3,"短天期");
input:period2(5,"長天期");

if barfreq = "Tick" or barfreq = "Min" then
begin
	value1=GetField("上漲量");
	value2=getfield("下跌量");
end else begin
	value1=GetField("上漲量","D");
	value2=getfield("下跌量","D");
end;
value3=average(value1,period1);
value4=average(value2,period1);
value5=value3-value4;//上漲量與下跌量比例
value6=average(value5,period2);
 
plot1(value6,"上漲下跌量差");
 