{@type:autotrade}
// 宣告參數
input: Length(10, "期數"), VolFactor(2, "成交量放大倍數");
var: avgP(0), avgVol(0);

// 設定資料讀取筆數
settotalbar(3);
setbarback(Length);

avgP = Average(close, Length);
avgVol = Average(volume, Length);

// 空方進場策略：帶量死亡交叉均線；出場策略：帶量黃金交叉均線。
if close cross below avgP and volume > avgVol * VolFactor then setposition(-1);
if close cross above avgP and volume > avgVol * VolFactor then setposition(0);