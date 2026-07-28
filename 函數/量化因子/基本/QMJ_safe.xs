{@type:function}
// QMJ_safe

// 因子
value99 = (GetField("因子_QMJ安全", "M") / GetField("本益比", "D"))*-1 ;
If Value99<>0 Then retVal = Value99;