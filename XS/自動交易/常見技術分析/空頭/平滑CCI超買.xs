{@type:autotrade|@guid:67bcd27ca1764395a21ee6be7dd97540|@path:/常見技術分析/空頭/平滑CCI超買}
// 宣告變數
Input: Length(14, "期數"), AvgLength(9, "平滑期數"), OverSold(100, "超買值");
Variable: cciValue(0), cciMAValue(0);

// 資料讀取筆數設定
SetTotalBar(maxlist(AvgLength + Length + 1,6) + 11);

cciValue = CommodityChannel(Length);
cciMAValue = Average(cciValue, AvgLength);

// 空方進場策略：平滑CCI黃金交叉超賣值。出場策略：平滑CCI死亡交叉超賣值。
if cciMAValue Crosses above OverSold then setposition(-1);
if cciMAValue Crosses Below OverSold then setposition(0);