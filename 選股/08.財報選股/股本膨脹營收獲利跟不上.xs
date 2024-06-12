{@type:filter}
//input:TXT("僅適用年資料"); setinputname(1,"使用限制");
setbarfreq("Y");

if barfreq <> "Y" then raiseruntimeerror("頻率錯誤");

settotalbar(4);

value1 = RateOfChange(GetField("普通股股本","Y"), 1);
value2 = RateOfChange(GetField("營業收入淨額","Y"), 1);
value3 = GetField("營業利益成長率","Y");

if 
	value1 > value2 and
	value1 > value3 and
	value1[1] > value2[1] and
	value1[1] > value3[1]
then
ret = 1;



