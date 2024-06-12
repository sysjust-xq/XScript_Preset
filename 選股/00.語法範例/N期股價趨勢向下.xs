{@type:filter}
input: Period(10); SetInputName(1, "期別");

settotalbar(3);

Condition1 = rateofchange(close, period) <= -1 * Period;
Condition2 = close < close[Period/2];
Condition3 = close < average(close, period);

ret = condition1 and condition2 and condition3;
