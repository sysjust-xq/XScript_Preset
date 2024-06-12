{@type:filter}
input:n(5);						setinputname(1,"研發費用市值比");

settotalbar(3);

value1=GetField("總市值");				// 單位=億
value2=GetField("研發費用","Y");		// 單位=百萬
value3=value2 / value1;					// % 
if value3 > n
then ret=1;

SetOutputName1("研發費用市值比");
OutputField1(value3);
