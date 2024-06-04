{@type:indicator|@guid:8f60a0b471b442f89c579f99c1a16842|@path:/大盤指標/移動平均線再平均指標|@hash:5c9a327d3d2d56583e8afa06e29d0475}
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
