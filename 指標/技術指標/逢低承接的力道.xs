{@type:indicator}
{
指標說明
https://xstrader.net/股性系列之五承接的力道/
收錄於「三週學會程式交易：打造你的第一筆自動化交易」 324頁
https://www.ipci.com.tw/books_in.php?book_id=724
}

input:
	short1(5,"短期平均"),
	mid1(20,"長期平均");

if truerange<>0 then begin
	if close<=open then 
		value1=(close-low)/truerange*100
	else
		value1=(open-low)/truerange*100;
end;

value2=average(value1,short1);
value3=average(value2,mid1);

plot1(value2,"短期均線");
plot2(value3,"長期均線");
