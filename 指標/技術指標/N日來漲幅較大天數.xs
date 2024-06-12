{@type:indicator}
{
指標說明
收錄於「三週學會程式交易：打造你的第一筆自動化交易」 327頁
https://www.ipci.com.tw/books_in.php?book_id=724
}

input:ratio(2,"列入計算之漲幅下限");
input:period(20,"計算區間");
input:period1(10,"移動平均天數");

if close[1]<>0 then
	value1=(close-close[1])/close[1]*100;
value2=countif(value1>=ratio,period);

plot1(value2,"漲幅大的天數");
plot2(average(value2,period1),"移動平均");