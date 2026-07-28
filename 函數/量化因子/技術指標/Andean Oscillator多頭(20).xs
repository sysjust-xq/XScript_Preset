{@type:function}
// Andean Oscillator
 
// 設定
Input:Length(20,NumericSimple,"Length for AO");            
Var:Alpha(0),Up1(0),Up2(0),Dn1(0),Dn2(0);
SetTotalBar(Length*3);

// 計算
Alpha=2/(Length+1);

Up1=MaxList(C,O,Up1[1]-(Up1[1]-C)*Alpha);
Up2=MaxList(C*C,O*O,Up2[1]-(Up2[1]-C*C)*Alpha);
Dn1=MinList(C,O,Dn1[1]+(C-Dn1[1])*Alpha);
Dn2=MinList(C*C,O*O,Dn2[1]+(C*C-Dn2[1])*Alpha);

// 因子
// 多頭 
Value99=SquareRoot(Dn2-Dn1*Dn1);
If Value99<>0 Then retVal = Value99;