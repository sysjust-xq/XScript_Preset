{@type:sensor|@guid:25100d8de82f42199873ca1c3c0fc0b7|@path:/技術分析/CCI超賣|@hash:9cd0a976d80f5e1d66ef1fad8289d88c}
// CCI超賣
//
Input: Length(14), AvgLength(9), OverSold(-100);
Variable: cciValue(0), cciMAValue(0);

SetTotalBar(maxlist(AvgLength + Length + 1,6) + 11);

SetInputName(1, "期數");
SetInputName(2, "平滑期數");
SetInputName(3, "超賣值");

cciValue = CommodityChannel(Length);
cciMAValue = Average(cciValue, AvgLength);

Ret = cciMAValue Crosses Below OverSold;



        