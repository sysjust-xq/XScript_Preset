{@type:filter|@guid:3fe7e8fb6e38444e8d35ab4c2e1319d4|@path:/02.基本技術指標/RSI高檔背離|@hash:8d42a692089161127dc38c2ae7b9ac12}
// RSI由高檔區往下, 與價格趨勢背離
//
Input: RSILength(6), Threshold(80), Region(5);
variable: rsiValue(0);

settotalbar(maxlist(RSILength,6) * 9);

SetInputName(1, "期數");
SetInputName(2, "高檔值");
SetInputName(3, "日期區間");

RSIValue = RSI(Close, RSILength);
If RSIValue Crosses Below Threshold and
   RSIValue < Lowest(RSIValue, Region) and 
   Close >= Highest(Close, Region) then
	Ret = 1;

setoutputname1("RSI");
outputfield1(RSIValue);
        
        