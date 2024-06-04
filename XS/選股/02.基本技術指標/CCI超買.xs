{@type:filter|@guid:1bc25f30cadb48ef811fe221d697fc9e|@path:/02.基本技術指標/CCI超買|@hash:3af7dd687f2c9babc77d3d8dd737e4a3}
// CCI超買
//
Input: Length(14), AvgLength(9), OverBought(100);
Variable: cciValue(0), cciMAValue(0);

SetTotalBar(maxlist(AvgLength + Length + 1,6) + 3);

SetInputName(1, "期數");
SetInputName(2, "平滑期數");
SetInputName(3, "超買值");

cciValue = CommodityChannel(Length);
cciMAValue = Average(cciValue, AvgLength);

Condition1 = cciMAValue Crosses Over OverBought;
If condition1 then ret = 1;

SetOutputName1("CCI");
OutputField1(cciValue);
