{@type:filter}
input:r1(5);	setinputname(1,"利息支出佔股本比例(%)");

settotalbar(3);

value1=GetField("最新股本");		//單位億
value2=GetField("利息支出","Y");	//單位百萬

value3=value2/(value1*100) * 100;

if value3 > r1
then ret=1;

SetOutputName1("利息支出佔股本比例(%)");
OutputField1(value3);
