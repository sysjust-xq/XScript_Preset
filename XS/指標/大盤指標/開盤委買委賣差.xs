{@type:indicator|@guid:63260bf5401e49faa7b1fcb30a73433c|@path:/大盤指標/開盤委買委賣差|@hash:102f5151228ce4e17f3027ab536ab695}
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

