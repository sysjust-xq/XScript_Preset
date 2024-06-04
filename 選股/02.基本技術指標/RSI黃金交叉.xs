{@type:filter|@guid:2c221eab3f0b420083c14a14d8eacbb2|@path:/02.基本技術指標/RSI黃金交叉|@hash:3723156c23ded86bd6799512a55f9e58}
// RSI短天期往上穿越長天期
//
input: ShortLength(6), LongLength(12);

settotalbar(maxlist(ShortLength,LongLength,6) * 9);

SetInputName(1, "短期期數");
SetInputName(2, "長期期數");

Ret = RSI(Close, ShortLength) Crosses Above RSI(Close, LongLength);




