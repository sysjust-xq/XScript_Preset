{@type:function}
// N日內買超天數

// 設定
Input:Days(20,NumericSimple,"計算天期(日)");
SetTotalBar(Days+10);

// ======================================================
// 籌碼資料-買賣超
Value4=GetField("自營商自行買賣買賣超", "D");

// 因子
Value99=CountIf(Value4>0,Days);
If Value99<>0 Then retVal = Value99;