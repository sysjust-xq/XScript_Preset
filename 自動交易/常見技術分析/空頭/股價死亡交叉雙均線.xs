{@type:autotrade}
// 宣告參數
input: shortlength(5,"短期均線期數"), Longlength(20,"長期均線期數");
variable: Longaverage(0), shortaverage(0);

// 資料讀取筆數設定
settotalbar(3);
setbarback(maxlist(shortlength,Longlength));

Longaverage = Average(close,Longlength);
shortaverage= Average(close,shortlength);

// 空方進場策略：收盤價死亡交叉雙均線。出場策略：收盤價黃金交叉雙均線。
if close cross below minlist(shortaverage, longaverage) then setposition(-1);
if close cross above maxlist(shortaverage, longaverage) then setposition(0);