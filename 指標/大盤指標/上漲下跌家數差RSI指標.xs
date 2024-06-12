{@type:indicator}
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
