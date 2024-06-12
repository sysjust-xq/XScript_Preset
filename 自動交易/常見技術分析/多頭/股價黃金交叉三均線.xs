{@type:autotrade}
// 宣告參數
input: shortlength(5,"短期均線期數"), midlength(10,"中期均線期數"), Longlength(20,"長期均線期數");
variable: shortaverage(0), midaverage(0), Longaverage(0);

// 資料讀取筆數設定
settotalbar(3);
setbarback(maxlist(shortlength,midlength,Longlength));

shortaverage=Average(close,shortlength);
midaverage=Average(close,midlength) ;
Longaverage=Average(close,Longlength); 

// 多方進場策略：收盤價黃金交叉三均線。出場策略：收盤價死亡交叉三均線。
if close cross above maxlist(shortaverage, midaverage, longaverage) then setposition(1);
if close cross below minlist(shortaverage, midaverage, longaverage) then setposition(0);