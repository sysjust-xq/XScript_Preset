{@type:indicator}
input: length1(5);	setinputname(1, "短天期");
input: length2(20);	setinputname(2, "長天期");

value1 = average(close, length1);
value2 = average(close, length2);

if value1 = 0 then value3 = 0 else value3 = 100 * (value1 - value2) / value1;

plot1(value3, "OSCP");


