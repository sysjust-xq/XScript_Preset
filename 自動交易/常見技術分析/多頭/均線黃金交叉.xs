{@type:autotrade}
// 宣告參數
input: Shortlength(5,"短期均線期數"), Longlength(20,"長期均線期數");

// 資料讀取筆數設定
settotalbar(8);
setbarback(maxlist(Shortlength,Longlength,6));

// 多方進場策略：短期均線「黃金」交叉長期均線。出場策略：長期均線「死亡」交叉短期均線。
if Average(Close,Shortlength) Cross Above Average(Close,Longlength) then setposition(1);
if Average(Close,Shortlength) Cross Below Average(Close,Longlength) then setposition(0);