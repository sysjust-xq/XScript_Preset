{@type:sensor}
// MTM往上穿越0軸
//
Input: Length(10);

settotalbar(maxlist(Length,6) + 8);

SetInputName(1, "期數");

Ret = Momentum(Close, Length) Crosses Above 0;
   

   
        