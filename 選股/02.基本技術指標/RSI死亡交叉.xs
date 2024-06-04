{@type:filter|@guid:d7ec1c419e82402abd4f561470a8e8f4|@path:/02.基本技術指標/RSI死亡交叉|@hash:8bec2ce9fbf1974a5faafb11d8531aa6}
// RSI短天期往下穿越長天期
//
input: ShortLength(6), LongLength(12);

settotalbar(maxlist(ShortLength,LongLength,6) * 9);

SetInputName(1, "短期期數");
SetInputName(2, "長期期數");

Ret = RSI(Close, ShortLength) Crosses Below RSI(Close, LongLength);



