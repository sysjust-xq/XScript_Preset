{@type:indicator}
{
指標說明
收錄於「三週學會程式交易：打造你的第一筆自動化交易」 245頁
https://www.ipci.com.tw/books_in.php?book_id=724
}

input:length(5,"天期");

value1=GetField("開盤委買", "D");
value2=GetField("開盤委賣", "D");
value3=value1-value2;
value4=average(value3,length);

plot1(value4,"開盤委買賣差之移動平均");

