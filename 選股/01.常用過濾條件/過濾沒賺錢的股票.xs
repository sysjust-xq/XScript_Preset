{@type:filter|@guid:2144f66280ee4369b61aa8a291da7e9e|@path:/01.常用過濾條件/過濾沒賺錢的股票}
// 過去四季每股盈餘加總必須 > 0
//
SetTotalbar(3);

Value1 = summation(GetField("EPS","Q"), 4);
Ret = Value1 > 0;

