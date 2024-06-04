{@type:sensor|@guid:c4221982621a4e98a5b729e482ea6b7f|@path:/技術分析/RSI黃金交叉|@hash:0024c950844185a4013fd2640f48e5c7}
// RSI短天期往上穿越長天期
//
input: ShortLength(6), LongLength(12);

settotalbar(maxlist(ShortLength,LongLength,6) * 8 + 8);

SetInputName(1, "短期期數");
SetInputName(2, "長期期數");

Ret = RSI(Close, ShortLength) Crosses Above RSI(Close, LongLength);



