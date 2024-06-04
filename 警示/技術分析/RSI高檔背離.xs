{@type:sensor|@guid:414c4bb3ac5b44baac8a45904e3a2a09|@path:/技術分析/RSI高檔背離|@hash:07c68373e615af07a6d34f4687635e1c}
// RSI由高檔區往下, 與價格趨勢背離
//
Input: RSILength(6), Threshold(80), Region(5);
variable: rsiValue(0);

settotalbar(maxlist(RSILength,6) * 8 + 8);

SetInputName(1, "期數");
SetInputName(2, "高檔值");
SetInputName(3, "日期區間");

RSIValue = RSI(Close, RSILength);
If RSIValue Crosses Below Threshold and
   RSIValue < Lowest(RSIValue, Region) and 
   Close >= Highest(Close, Region) then
	Ret = 1;


        
        