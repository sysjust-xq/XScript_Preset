{@type:indicator|@guid:3da2e31f1d4443d58956e07e2fd7020b|@path:/技術指標/價格震盪指標|@hash:07cf937e5f582f366ad793c13033e36e}
input: length1(5);	setinputname(1, "短天期");
input: length2(20);	setinputname(2, "長天期");

value1 = average(close, length1);
value2 = average(close, length2);

if value1 = 0 then value3 = 0 else value3 = 100 * (value1 - value2) / value1;

plot1(value3, "OSCP");


