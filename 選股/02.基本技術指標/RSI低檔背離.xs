{@type:filter}
// RSI由下往上, 與價格趨勢背離
Input: RSILength(6, "期數"), Threshold(20, "低檔值"), Region(5, "日期區間");
variable: rsiValue(0);

settotalbar(RSILength * 9);
setbackBar(RSILength);

RSIValue = RSI(Close, RSILength);
If RSIValue Crosses Above Threshold and
   RSIValue = Highest(RSIValue, Region) and
   LinearRegSlope(close,Region) < 0 then
   Ret = 1;
   
outputfield1(RSIValue,"RSI");