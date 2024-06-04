{@type:filter|@guid:036c1a5d287e4f2b8046b23e731fbaa8|@path:/02.基本技術指標/MTM跌破0|@hash:6002cfc8d7e9ef13cc7905c4352adb0d}
// MTM往下跌破0軸
//
Input: Length(10);

SetInputName(1, "期數");

settotalbar(maxlist(Length,6));

Ret = Momentum(Close, Length) Crosses Below 0;



