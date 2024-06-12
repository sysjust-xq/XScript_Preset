{@type:indicator}
{
指標說明
收錄於「三週學會程式交易：打造你的第一筆自動化交易」 326頁
https://www.ipci.com.tw/books_in.php?book_id=724
}

input:length1(5,"短天期均線天期");
input:length2(20,"長天期均線天期");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");
	
value1=GetField("法人買張");
if volume<>0 then value2=value1/volume*100;
//法人買張佔成交量比例
value3 = Average(value2,length1);
value4 = Average(value2,length2);
plot1(value3,"短期均線");
plot2(value4,"長期均線");


