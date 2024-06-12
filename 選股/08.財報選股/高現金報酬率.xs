{@type:filter}
input:r1(5);		setinputname(1,"現金報酬率下限(%)");

settotalbar(3);

// 自由現金流
//
value1 = GetField("來自營運之現金流量","Q") - (GetField("固定資產","Q") - GetField("固定資產","Q")[1]);

// 淨利息費用

value2=GetField("利息支出","Q") - GetField("利息收入","Q");				

// 現金報酬率(%)
//
value3 = (value1 + value2) / GetField("企業價值","Q") * 100;

if value3 > r1 then ret = 1;
 
SetOutputName1("現金報酬率(%)");
OutputField1(value3);
 