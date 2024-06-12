{@type:sensor}
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



        