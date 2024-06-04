{@type:filter|@guid:b9cf9949e8564eab9053fbe24116910c|@path:/06.籌碼選股/融資追捧|@hash:fc9032bb16e420c94b1bdc727dd8f4b9}
input: Length(10); setinputname(1,"近期天數");
input: UpRatio(3.5); setinputname(2, "上漲幅度(%)");

settotalbar(3);

if RateOfChange(Close, 1) >= UpRatio and
	Getfield("融資餘額張數") > 0 and
	Getfield("融資餘額張數") = highest(Getfield("融資餘額張數"), Length)  
then ret=1;

SetOutputName1("融資餘額張數");
OutputField1(Getfield("融資餘額張數"));
