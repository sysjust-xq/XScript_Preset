{@type:indicator}
{
指標說明
https://xstrader.net/移動平均線再平均指標/
收錄於「三週學會程式交易：打造你的第一筆自動化交易」 257頁
https://www.ipci.com.tw/books_in.php?book_id=724
}
input: Period1(5,"一次平均期數");
input: Period2(5,"二次平均期數");
input: Period3(10,"累計期數");

value1=average(close,Period1);
value2=average(value1,Period2);
value3=value1-value2;
value4=summation(value3,Period3);
plot1(value4,"多空");
