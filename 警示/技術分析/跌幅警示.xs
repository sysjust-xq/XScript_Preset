{@type:sensor|@guid:aec37f8a3c7f48b8ad3dbec3ad2c4263|@path:/技術分析/跌幅警示|@hash:2f2f3253c935abafd9c38cf4d770f1ae}
input: Length(5), Percent(3);

settotalbar(3);
setbarback(length);

SetInputName(1, "計算期數");
SetInputName(2, "累計下跌幅度(%)");

Ret = RateOfChange(Close, Length) < -1 * Percent;



