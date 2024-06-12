{@type:indicator}
{
指標說明
https://xstrader.net/大盤多空轉換點之探討系列一-上漲的股票有沒有200/
收錄於「三週學會程式交易：打造你的第一筆自動化交易」 252頁
https://www.ipci.com.tw/books_in.php?book_id=724
}

input:shortterm(5,"期間");
input:midterm(15,"平均");

value1=GetField("上漲家數");
value2=lowest(value1,shortterm);
value3=average(value2,midterm);
plot1(value3,"平均上漲家數");
plot2(200,"多");
plot3(100,"空");
