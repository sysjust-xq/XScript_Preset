{@type:filter}
input: amount(1000);		setinputname(1, "減少張數");

SetTotalBar(3);

value1 = GetField("借券賣出餘額張數");
if value1[1] - value1 > amount
then ret=1;

setoutputname1("借券賣出減少張數");
outputfield1(value1[1] - value1);
