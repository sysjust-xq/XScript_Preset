{@type:filter}
input:r1(1);		setinputname(1,"股價淨值比上限");

SetTotalBar(3);

value1 = average(GetField("營業利益成長率", "Y"), 6);		// 近六年平均營業利益成長率
value2 = GetField("每股淨值(元)","Q") * (1 + value1/100);	// 修正後每股淨值
value3 = close / value2;									// 修正後股價淨值比

if 0 < value3 and value3 < r1
then ret=1;

SetOutputName1("修正後股價淨值比");
OutputField1(value3);

