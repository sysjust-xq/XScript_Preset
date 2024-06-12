{@type:function}
{
	DiffUpDownVolume為分時漲跌成交量的函數，
	該函數運算出來的數值，與XS指標的「分時漲跌成交量」指標相同。
}

DiffUpDownVolume = GetField("上漲量") - GetField("下跌量");