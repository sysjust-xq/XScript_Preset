{@type:function}
// 築底指標(ZDZB)

// 設定
Input:ZDZBLen(125,NumericSimple,"ZDZB指標區間");   
Input:Len1(5,NumericSimple,"短MA期數"),Len2(20,NumericSimple,"長MA期數");     
Var:ZDZB(0);
Var:ZDZBMA1(0),ZDZBMA2(0);
SetTotalBar(Len2+10);

// 計算
ZDZB=CountIf(C>=C[1],ZDZBLen)/CountIf(C<C[1],ZDZBLen);
ZDZBMA1=Average(ZDZB,Len1); 
ZDZBMA2=Average(ZDZB,Len2); 

// 因子
Value99=ZDZBMA1-ZDZBMA2;
If Value99<>0 Then retVal = Value99;