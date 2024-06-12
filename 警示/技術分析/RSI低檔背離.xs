{@type:sensor}
// RSI由下往上, 與價格趨勢背離
//
Input: RSILength(6), Threshold(20), Region(5);
variable: rsiValue(0);

settotalbar(maxlist(RSILength,6) * 8 + 8);

SetInputName(1, "期數");
SetInputName(2, "低檔值");
SetInputName(3, "日期區間");

RSIValue = RSI(Close, RSILength);
If RSIValue Crosses Above Threshold and
   RSIValue >= Highest(RSIValue, Region) and 
   Close <= Lowest(Close, Region) then
   Ret = 1;



        