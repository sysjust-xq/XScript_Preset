{@type:autotrade|@guid:d65d6475a0394bf09e6a802083d5c009|@path:/常見技術分析/多頭/平滑CCI超賣}
// 宣告變數
Input: Length(14, "期數"), AvgLength(9, "平滑期數"), OverSold(-100, "超賣值");
Variable: cciValue(0), cciMAValue(0);

// 資料讀取筆數設定
SetTotalBar(maxlist(AvgLength + Length + 1,6) + 11);

cciValue = CommodityChannel(Length);
cciMAValue = Average(cciValue, AvgLength);

// 多方進場策略：平滑CCI死亡交叉超賣值。出場策略：平滑CCI黃金交叉超賣值。
if cciMAValue Crosses Below OverSold then setposition(1);
if cciMAValue Crosses above OverSold then setposition(0);