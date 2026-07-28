{@type:function}
// 人氣指標AR_250

// 設定
var :ndays(250); 

// 因子
Value99 = AR(ndays);     
If Value99<>0 Then retVal = Value99;