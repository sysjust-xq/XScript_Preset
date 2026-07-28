{@type:function}
// 借券賣出餘額張數

// 設定
Input:Days(1,NumericSimple,"計算天期(日)");
SetTotalBar(Days+10);

// ======================================================
// 借券資料
Value3=GetField("借券賣出餘額張數", "D");

// 因子
Value99=Value3;
If Value99<>0 Then retVal = Value99;