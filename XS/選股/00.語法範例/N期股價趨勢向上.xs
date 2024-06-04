{@type:filter|@guid:f317e8743f7c48aaa58311b9b2a8a5fe|@path:/00.語法範例/N期股價趨勢向上}
input: Period(10); SetInputName(1, "期別");

settotalbar(3);

Condition1 = rateofchange(close, period) >= Period;
Condition2 = close > close[Period/2];
Condition3 = close > average(close, period);

ret = condition1 and condition2 and condition3;
