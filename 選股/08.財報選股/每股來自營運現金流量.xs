{@type:filter}
input:r1(25);	setinputname(1,"來自營運的現金流量佔股本比率下限%");

settotalbar(3);

value1=GetField("最新股本");				// 單位=億
value2=GetField("來自營運之現金流量","Q");	// 單位=百萬
value3=value2/value1;						// 單位=%

if value3 > r1
then ret=1;

setoutputname1("來自營運的現金流量佔股本比率(%)");
outputfield1(value3);