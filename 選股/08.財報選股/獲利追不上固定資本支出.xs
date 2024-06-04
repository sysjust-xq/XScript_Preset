{@type:filter|@guid:9579aca21ec24985ab09d46e4b8c4ec3|@path:/08.財報選股/獲利追不上固定資本支出}
input:r1(3);		setinputname(1,"連續幾年資本支出增加的速度比稅後淨利高");
//input:TXT("僅適用年資料"); setinputname(2,"使用限制");
setbarfreq("Y");

if barfreq <> "Y" then raiseruntimeerror("頻率錯誤");

settotalbar(3);

if trueall(
	GetField("本期稅後淨利","Y") - GetField("本期稅後淨利","Y")[1] <
	GetField("固定資產","Y") - GetField("固定資產","Y")[1],
	r1)
then ret=1;
