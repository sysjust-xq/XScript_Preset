{@type:filter|@guid:e9a250b6297f4affa286bd558cc010f0|@path:/08.財報選股/帳上現金少}
input:r1(50);	setinputname(1,"帳上現金(單位:百萬元)");

settotalbar(3);

value1=GetField("現金及約當現金","Q");
if value1 < r1
then ret=1;

SetOutputName1("帳上現金(百萬)");
OutputField1(value1);
