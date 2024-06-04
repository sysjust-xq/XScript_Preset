{@type:autotrade|@guid:78bd0a38b9e74c44956f5d758bda53b6|@path:/常見技術分析/空頭/MTM死亡交叉0}
// 宣告參數
Input: Length(10, "期數");

// 資料讀取筆數設定
settotalbar(maxlist(Length,6) + 8);

// 空方進場策略：MTM死亡交叉0軸；出場策略：MTM黃金交叉0軸
if Momentum(Close, Length) Crosses below 0 then setposition(-1); 
if Momentum(Close, Length) Crosses Above 0 then setposition(0); 