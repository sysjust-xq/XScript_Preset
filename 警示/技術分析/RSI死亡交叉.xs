{@type:sensor}
// RSI短天期往下穿越長天期
//
input: ShortLength(6), LongLength(12);

settotalbar(maxlist(ShortLength,6) * 8 + 8);

SetInputName(1, "短期期數");
SetInputName(2, "長期期數");

Ret = RSI(Close, ShortLength) Crosses Below RSI(Close, LongLength);



