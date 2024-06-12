{@type:filter}
input:r1(10);		setinputname(1,"本益比上限");
input:years(8);		setinputname(2,"計算期間(年)");

settotalbar(3);

value1=GetField("最新股本");			//單位=億元
value2=GetField("本期稅後淨利","Y");	//單位=百萬元
value3=average(GetField("本期稅後淨利","Y"), years);	//稅後淨利平均
value4=value3/(value1*10);				//每股盈餘
value6=GetField("收盤價","D");

if value4 > 0 then
begin
	value5 = GetField("收盤價","D") / value4;
	if value5 < r1 then ret = 1;
	
	SetOutputName1("平均盈餘本益比");
	OutputField1(value5);
end;



