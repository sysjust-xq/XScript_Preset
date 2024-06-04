{@type:sensor|@guid:54f5f95fdc9f408bb8fba46595941af2|@path:/A股用語/九陰白骨爪|@hash:d40e97d6a6403dd0dce767352be428aa}
// 連續9筆K線收黑
//
settotalbar(10);
Ret = TrueAll(close < open, 9);
