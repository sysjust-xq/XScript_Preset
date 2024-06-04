{@type:filter|@guid:2ce78f4e06c54924b01509d2a0de31d3|@path:/00.語法範例/週轉率大於X%}
Input: X(5); SetInputName(1, "週轉率%");

settotalbar(3);

Value1 = GetField("週轉率","D");
if Value1 > X then Ret = 1;

SetOutputName1("週轉率%");
outputfield1(Value1);

