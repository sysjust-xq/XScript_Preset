{@type:filter|@guid:54f19658275e4c74981fa74ce06cfcbd|@path:/00.語法範例/N期股價趨勢向下}
input: Period(10); SetInputName(1, "期別");

settotalbar(3);

Condition1 = rateofchange(close, period) <= -1 * Period;
Condition2 = close < close[Period/2];
Condition3 = close < average(close, period);

ret = condition1 and condition2 and condition3;
