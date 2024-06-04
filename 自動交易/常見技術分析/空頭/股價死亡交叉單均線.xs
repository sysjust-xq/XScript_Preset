{@type:autotrade|@guid:f9713b0c1fd6436e9bf1fbf6163cdfdf|@path:/常見技術分析/空頭/股價死亡交叉單均線}
// 宣告參數
input: length(5,"均線期數");
variable: avgValue(0);

// 資料讀取筆數設定
settotalbar(3);
setbarback(length);

avgValue = Average(close,length);

// 空方進場策略：收盤價死亡交叉均線。出場策略：收盤價黃金交叉均線。
if close cross below avgValue then setposition(-1);
if close cross above avgValue then setposition(0);