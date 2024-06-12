{@type:filter}
input: r1(5);		setinputname(1, "月營收月增率上限(%)");
input: r2(30);		setinputname(2, "預估本益比下限");

settotalbar(3);

value1 = 4 * GetField("每股稅後淨利(元)","Q");	// 預估每股盈餘(年)
if value1 > 0 then
	value2 = close / value1				//本益比
else	
	value2 = 0;	

if value2 > r2 and 
   trueall(GetField("月營收月增率","M") < r1, 3) 
then ret = 1;

setoutputname1("預估每股盈餘(元)");
outputfield1(value1);

