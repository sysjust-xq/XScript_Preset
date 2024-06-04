{@type:sensor|@guid:d1049478207c43919727cea12f242134|@path:/技術分析/MTM往上穿過0|@hash:301287abd4cfc8f3d7aa6c252d90fb1b}
// MTM往上穿越0軸
//
Input: Length(10);

settotalbar(maxlist(Length,6) + 8);

SetInputName(1, "期數");

Ret = Momentum(Close, Length) Crosses Above 0;
   

   
        