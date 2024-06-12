{@type:filter}
input: r1(50);		setinputname(1,"現金佔總市值比例%");

settotalbar(3);

value1=GetField("現金及約當現金","Q");	// 單位=百萬
value2=GetField("總市值","D");			// 單位=億
value3=value1/value2;					// 單位=%

if value3 > r1 then ret=1;

SetoutputName1("現金佔總市值比例%");
OutputField1(value3);
