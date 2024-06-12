{@type:indicator}
{
指標說明
https://xstrader.net/多空六大階段指標/
收錄於「三週學會程式交易：打造你的第一筆自動化交易」 259頁
https://www.ipci.com.tw/books_in.php?book_id=724
}

var:m50(0),m200(0);
m50=average(close,50);
m200=average(close,200);
if close > m50 and c< m200 and m50<m200
then value1=10
else value1=0;
if close > m50 and c> m200 and m50<m200
then value2=20
else value2=0;
if close > m50 and c> m200 and m50 > m200
then value3=30
else value3=0;
if close < m50 and c>m200 and m50>m200
then value4=-10
else value4=0;
if close < m50 and c <m200
then value5=-20
else value5=0;
if close < m50 and c <m200 then value6=-30
else value6=0;
plot1(value1,"復甦期");
plot2(value2,"收集期");
plot3(value3,"多頭");
plot4(value4,"警示期");
plot5(value5,"發散期");
plot6(value6,"空頭");