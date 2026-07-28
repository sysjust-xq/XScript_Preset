{@type:function}
// Yang-Zhang(YZ) Volatility Estimator

// 設定
Input:Len(14,NumericSimple),Coef_C(0.34,NumericSimple,"係數C"),Coef_K(0.34,NumericSimple,"係數K");
Var:R_OC1(0),R_CO(0),R_HL(0);
Var:R_OC1_VAR(0),R_CO_VAR(0),R_HL_VAR(0),YZ_VAR(0);

SetTotalBar(Len*3);

// 計算
R_OC1=Log(O/C[1]);
R_CO=Log(C/O);
R_HL=Log(H/L);

R_OC1_VAR=VariancePS(R_OC1,Len,1);
R_CO_VAR=VariancePS(R_CO,Len,1);
R_HL_VAR=VariancePS(R_HL,Len,1);

YZ_VAR = Coef_K*R_OC1_VAR + (1-Coef_K)*R_CO_VAR + Coef_K*R_HL_VAR;
YZ_VAR = Maxlist(YZ_VAR,0);

// 因子
Value99=SQuareRoot(YZ_VAR);
If Value99<>0 Then retVal = Value99;