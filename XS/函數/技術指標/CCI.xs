{@type:function|@guid:75ca08eed8e641809cfba6d6c7b6a01b|@path:/技術指標/CCI}
SetBarMode(1);

{
Length : CCI指標計算期間
}
input: Length(numeric);
cci = CommodityChannel(Length);

		