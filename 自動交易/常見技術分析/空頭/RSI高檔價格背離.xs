{@type:autotrade}
// 宣告參數
Input: RSILength(10, "RSI期數"), _LThreshold(20, "低檔值"), _HThreshold(80, "高檔值");
variable: rsiValue(0),RSI_linearregslope(0),Close_linearregslope(0);

// 資料讀取筆數設定
settotalbar(maxlist(RSILength,6) * 8 + 8);

if RSILength < 5 then raiseruntimeerror("計算期別請超過五期");
RSIValue = RSI(Close, RSILength);
RSI_linearregslope = linearregslope(RSIValue, RSILength);
Close_linearregslope = linearregslope(Close, RSILength);

// 空方進場策略：RSI由上往下穿越高檔區，且價格趨勢背離。出場策略：RSI由下往上突破低檔區，且價格趨勢背離。
if RSIValue Crosses Below _HThreshold and RSI_linearregslope < 0 and Close_linearregslope > 0 then setposition(-1);
if RSIValue Crosses Above _LThreshold and RSI_linearregslope > 0 and Close_linearregslope < 0 then setposition(0);