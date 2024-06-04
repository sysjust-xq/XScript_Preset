{@type:sensor|@guid:ae50edbe0f1e4e8d939661cd7033bd73|@path:/技術分析/MTM跌破0|@hash:77f940ea1ce67a39212a552c17e7a507}
// MTM往下跌破0軸
//
Input: Length(10);

settotalbar(maxlist(Length,6) + 8);

SetInputName(1, "期數");

Ret = Momentum(Close, Length) Crosses Below 0;



