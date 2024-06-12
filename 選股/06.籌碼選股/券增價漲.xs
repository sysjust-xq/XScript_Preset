{@type:filter}
input: Length(10); setinputname(1,"近期天數");
input: UpRatio(3.5); setinputname(2, "上漲幅度(%)");

settotalbar(3);

if RateOfChange(Close, 1) >= UpRatio and
	Getfield("融券餘額張數") > 0 and
	Getfield("融券餘額張數") = highest(Getfield("融券餘額張數"), Length)  
then ret=1;

SetOutputName1("融券餘額張數");
OutputField1(Getfield("融券餘額張數"));
