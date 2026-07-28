{@type:function}
// ROE_PB

// 設定
Var: ratio(0);
settotalBar(120);

// 因子
Value99 = GetField("股東權益報酬率", "Q") / GetField("股價淨值比", "D");
If Value99<>0 Then retVal = Value99;