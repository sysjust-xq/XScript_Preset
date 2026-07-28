{@type:function}
// StochRSI

// 設定
Input:RSILen(14,NumericSimple),K_Len(3,NumericSimple),D_Len(3,NumericSimple),Stoch_Len(9,NumericSimple);
Var:RSIValue(0),KValue(0),DValue(0);
SetTotalBar(RSILen*3);

// 計算
// Calculate RSI
RSIValue=RSI(C,RSILen);

// Calculate StochRSI %K and %D
Value1=100*(RSIValue-Lowest(RSIValue,Stoch_Len))/(Highest(RSIValue,Stoch_Len)-Lowest(RSIValue,Stoch_Len));
KValue=Average(Value1,K_Len);
DValue=Average(KValue,D_Len);

// 因子
Value99=KValue;
//Value99=DValue;
//Value99=KValue-DValue;
If Value99<>0 Then retVal = Value99;