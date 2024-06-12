{@type:indicator}
{
指標說明
https://xstrader.net/自訂指標的撰寫技巧以q指標為例/
收錄於「三週學會程式交易：打造你的第一筆自動化交易」 317頁
https://www.ipci.com.tw/books_in.php?book_id=724
}

input:t1(10,"計算累積價格變動的bar數");
input:t2(5,"短期平均天期");
input:t3(20,"長期平均天期");

value1=close-close[1];//價格變化
value2=summation(value1,t1);//累積價格變化
value3=average(value2,t2);//短期平均
value4=average(value2,t3);//長期平均

plot1(value3,"短期累積價格變化平均");
plot2(value4,"長期累積價格變化平均");


