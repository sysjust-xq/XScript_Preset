{@type:indicator}
{
指標說明
https://xstrader.net/top1/
收錄於「三週學會程式交易：打造你的第一筆自動化交易」 254頁
https://www.ipci.com.tw/books_in.php?book_id=724
}

input:period1(5,"短天期");
input:period2(20,"長天期");
value1=GetField("上漲家數");
value2=GetField("下跌家數");
value3=value1+value2;
if value3 = 0 then 
	value4 = 0 
else
	value4=value1/value3*100;
value5=average(value4,period1);
value6=average(value4,period2);

plot1(value5,"上漲佔比短期平均");
plot2(value6,"上漲佔比長期平均");
plot3(value5-value6,"長短天期差");
