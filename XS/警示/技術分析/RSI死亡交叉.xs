{@type:sensor|@guid:58cabd4e651e46658ec8a8730a2a594a|@path:/技術分析/RSI死亡交叉|@hash:f93d67756fe641e8a7d56fca9d2478fd}
// RSI短天期往下穿越長天期
//
input: ShortLength(6), LongLength(12);

settotalbar(maxlist(ShortLength,6) * 8 + 8);

SetInputName(1, "短期期數");
SetInputName(2, "長期期數");

Ret = RSI(Close, ShortLength) Crosses Below RSI(Close, LongLength);



