{@type:autotrade}
// 宣告參數
input: ShortLength(6, "短期期數"), LongLength(12, "長期期數");
var:RSI_Short(0), RSI_Long(0);

// 設定資料讀取筆數
settotalbar(maxlist(ShortLength,LongLength,6) * 8 + 8);

RSI_Short=RSI(Close, ShortLength);
RSI_Long=RSI(Close, LongLength);

// 空方進場策略：短期RSI死亡交叉長期RSI；出場策略：短期RSI黃金交叉長期RSI
if RSI_Short Crosses below RSI_Long then setposition(-1);
if RSI_Short Crosses above RSI_Long then setposition(0);