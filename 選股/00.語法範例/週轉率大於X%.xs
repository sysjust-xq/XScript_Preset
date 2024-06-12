{@type:filter}
Input: X(5); SetInputName(1, "週轉率%");

settotalbar(3);

Value1 = GetField("週轉率","D");
if Value1 > X then Ret = 1;

SetOutputName1("週轉率%");
outputfield1(Value1);

