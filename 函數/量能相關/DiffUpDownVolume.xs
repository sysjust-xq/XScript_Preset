{@type:function|@guid:239ca73adde04657aae5efd593c1bc07|@path:/量能相關/DiffUpDownVolume}
{
	DiffUpDownVolume為分時漲跌成交量的函數，
	該函數運算出來的數值，與XS指標的「分時漲跌成交量」指標相同。
}

DiffUpDownVolume = GetField("上漲量") - GetField("下跌量");