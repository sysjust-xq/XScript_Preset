{@type:filter}
input:r1(12);			setinputname(1,"流動資產市值比下限%");

settotalbar(3);

value1=GetField("流動資產","Q");	// 單位=百萬
value2=GetField("總市值","D");		// 單位=億
value3=value1/value2;				// 單位=%
if value3 < r1
then ret=1;

setoutputname1("流動資產市值比%");
outputfield1(value3);
