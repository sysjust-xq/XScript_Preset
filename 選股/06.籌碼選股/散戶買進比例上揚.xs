{@type:filter}
Input: r1(50);	setinputname(1, "散戶買進比例下限(%)");
Input: r2(500);	setinputname(2, "五日均量下限(張)");

SetTotalBar(28);

value1=GetField("散戶買張");
value2=value1/volume*100;		// 散戶買張比例
value3=average(value2,5);		// 短期散戶比例
value4=average(value2,20);		// 長期散戶比例

if value2 > r1 and
   value3 crosses above value4 and
   average(volume,5) > r2
then ret=1;

SetOutputName1("散戶買進比例(%)");
OutputField1(value2);


