{@type:function}
// N日籌碼區間買超賣超比

// 設定
Input:Days(20,NumericSimple,"計算天期(日)");
Var:i(0),PSum(0),NSum(0);
SetTotalBar(Days+10);
  
// ======================================================
// 籌碼資料
Value1=GetField("自營商自行買賣買賣超", "D");

// 籌碼主角
Value50=Value1;

// 計算
PSum=0;NSum=0;

For i = 0 To Days-1 Begin 
    If Value50[i]>0 Then 
	   PSum=PSum+Value50[i]
    Else
       NSum=NSum+Value50[i];	
End;

// 因子
Value99=0;
If NSum<>0 Then 
   Value99=100*((PSum/-NSum)-1);
If Value99<>0 Then retVal = Value99;