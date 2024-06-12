{@type:sensor}
// 連續9筆K線收黑
//
settotalbar(10);
Ret = TrueAll(close < open, 9);
