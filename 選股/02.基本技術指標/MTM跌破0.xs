{@type:filter}
// MTM往下跌破0軸
//
Input: Length(10);

SetInputName(1, "期數");

settotalbar(maxlist(Length,6));

Ret = Momentum(Close, Length) Crosses Below 0;



