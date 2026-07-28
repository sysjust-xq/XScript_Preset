{@type:function}
// 海龜N日_潛在波動性

// 設定
Inputs:Days(20,NumericSimple,"計算週期");
Vars:N(0),TR(0);
SetTotalBar(Days+20);

// ======================================================
// 初始化

// ======================================================
// 計算
If CurrentBar>1 Then Begin 
   // 記錄真實波動幅度
      TR=MaxList(H-L,H-C[1],C[1]-L);
   // 計算潛在波動性
      N=(Days-1)/Days*N[1]+1/Days*TR;  
End	  
Else
   N=0;
	
// 因子
Value99=N;
If Value99<>0 Then retVal = Value99;