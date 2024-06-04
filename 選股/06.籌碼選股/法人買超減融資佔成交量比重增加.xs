{@type:filter|@guid:a03b674a1756491d934a5fd8dd2578e3|@path:/06.籌碼選股/法人買超減融資佔成交量比重增加}
input: r1(15);				setinputname(1,"籌碼收集比例(%)");
input: volLimit(1000);		setinputname(2,"成交量下限(張)");

settotalbar(3);

value1 = (GetField("法人買賣超張數") - GetField("融資買進張數")) / Volume * 100;

if value1 > r1 and volume > volLimit then
ret = 1;

setoutputname1("法人籌碼收集比例(%)");
outputfield1(value1);

