{@type:filter}
input:r1(50);		setinputname(1,"累計營業利益佔總市值比例(%)");
input:years(10);		setinputname(2,"計算期間(年)");

settotalbar(3);

value1=GetField("總市值","D");		//單位億
value2=summation(GetField("營業利益","y"),years);
value3=value2/value1;				//單位=百分比

if value3 < r1
then ret=1;

setoutputname1("累計營業利益佔市值比例(%)");
outputfield1(value3);




