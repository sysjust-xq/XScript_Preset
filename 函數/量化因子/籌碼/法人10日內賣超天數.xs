{@type:function}
// N日內賣超天數

// 設定
Input:Days(10,NumericSimple,"計算天期(日)");
SetTotalBar(Days+10);

// ======================================================
// 籌碼資料-買賣超
Value8=GetField("法人買賣超張數", "D");
 
// 因子
Value99=CountIf(Value8<0,Days);
If Value99<>0 Then retVal = Value99;