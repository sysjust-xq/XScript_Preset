{@type:function}
// OBV MACD INDICATOR

// 設定
Var:v_MACD(0),v_DIF(0),v_OSC(0);
Var:OBVol(0);  
SetTotalBar(100);
SetBarMode(1);

// 計算
If CurrentBar = 1 Then
   OBVol=0
Else Begin	
   If C>C[1] Then
	  OBVol=OBVol[1]+V
   Else If C<C[1] Then
	  OBVol=OBVol[1]-V
   Else 
	  OBVol=OBVol[1];	
End;
MACD(OBVol,12,26,9,v_DIF,v_MACD,v_OSC);  

// 因子
Value99=v_OSC;
If Value99<>0 Then retVal = Value99;