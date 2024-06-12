{@type:sensor}
input: Length(5), Percent(3);

settotalbar(3);
setbarback(length);

SetInputName(1, "計算期數");
SetInputName(2, "累計下跌幅度(%)");

Ret = RateOfChange(Close, Length) < -1 * Percent;



