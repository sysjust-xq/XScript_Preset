{@type:function}
SetBarMode(1);

{
Length : CCI指標計算期間
}
input: Length(numeric);
cci = CommodityChannel(Length);

		