{@type:filter}
input:r1(10,"固定資產佔股本比例(單位%)");

value1=GetField("最新股本");//單位億
value2=GetField("固定資產","Q");
value3=value2/(value1*100);

if value3<r1/100
then ret=1;