{@type:sensor|@guid:9b22a66be6954810b0b83eeab96ebe31|@path:/技術分析/RSI低檔背離|@hash:62f37bc022d7fa51aab56d75d58081d0}
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



        