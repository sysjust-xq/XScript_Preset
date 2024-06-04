{@type:filter|@guid:ec2b785d114c4d97bfb19d7657958fb8|@path:/03.進階技術分析/波動幅度開始變大}
input: Length(20);		SetInputName(1, "計算區間");
input: VolLimit(1000); SetInputName(2, "成交量限制");

value1 = truerange();
value2 = highest(value1,Length);

SetTotalBar(Length + 3);

if 
	value1 > value2[1] and 
	value1 > value1[1] and 
	close * 1.01 > high and 
	close > close[1] and 
	volume > VolLimit
then ret=1;


