{@type:indicator}
{
指標說明
收錄於「三週學會程式交易：打造你的第一筆自動化交易」 327頁
https://www.ipci.com.tw/books_in.php?book_id=724
}

input:
	short1(5,"短期平均"),
	mid1(12,"長期平均");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");
	
value1=GetField("資金流向");
value2=average(value1,20);
value3=value1-value2;
value4=average(value3,short1);
value5=average(value3,mid1);

plot1(value4,"短期均線");
plot2(value5,"長期均線");


