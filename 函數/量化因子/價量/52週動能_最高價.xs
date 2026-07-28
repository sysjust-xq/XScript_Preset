{@type:function}
// 52週動能_最高價

// 設定
Var:moment(0);
settotalBar(750);

// 因子
moment = close/ highest(high,252) ;
Value99 = moment ;
If Value99<>0 Then retVal = Value99;