{@type:filter}
input:r1(1);	setinputname(1,"PEG上限");

settotalbar(3);

// PEG指標
//
value1 = GetField("本益比","D");
value2 = GetField("月營收年增率","M"); 
if value1 > 0 and value2 > 0 and value1 / value2 < r1 then
ret=1;

SetOutputName1("PEG指標");
OutputField1(value1 / value2);

