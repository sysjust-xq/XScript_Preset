{@type:indicator|@guid:0e1cbd3dee234246b89227f5c64e08c9|@path:/大盤指標/上漲下跌家數差RSI指標|@hash:f52d31b324ce8cf7172dd39547969fd2}
{
指標說明
https://xstrader.net/上漲下跌家數差RSI指標/
收錄於「三週學會程式交易：打造你的第一筆自動化交易」 256頁
https://www.ipci.com.tw/books_in.php?book_id=724
}

input:period(10,"RSI計算天數");

if barfreq <> "D" then raiseruntimeerror("不支援此頻率");

value1=getfield("上漲家數");
value2=getfield("下跌家數");
value3=value1-value2;
value4=summation(value3,period);
value5=rsi(value4,period);
plot1(value5,"上漲家數RSI");
