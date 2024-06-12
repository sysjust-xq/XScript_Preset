{@type:filter}
// 過去四季每股盈餘加總必須 > 0
//
SetTotalbar(3);

Value1 = summation(GetField("EPS","Q"), 4);
Ret = Value1 > 0;

