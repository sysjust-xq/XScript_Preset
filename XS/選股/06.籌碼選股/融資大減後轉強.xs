{@type:filter|@guid:c42f4f2dde0743dab1e2218385c2327f|@path:/06.籌碼選股/融資大減後轉強}
input: period(80);		setinputname(1, "計算區間");
input: v1(3000);		setinputname(2, "融資減少張數");

SetTotalBar(3);

value1 = highestbar(close,period);
value2 = GetField("融資餘額張數")[value1] - GetField("融資餘額張數");

if  value2 > v1 and 
	trueall(close > close[1],3)
then ret=1;

SetOutputName1("融資減少張數");
OutputField1(value2);

