{@type:filter}
input: r1(15);				setinputname(1,"籌碼收集比例(%)");
input: volLimit(1000);		setinputname(2,"成交量下限(張)");

settotalbar(3);

value1 = (GetField("法人買賣超張數") - GetField("融資買進張數")) / Volume * 100;

if value1 > r1 and volume > volLimit then
ret = 1;

setoutputname1("法人籌碼收集比例(%)");
outputfield1(value1);

