{@type:function}
{
	DiffTradeVolumeAtAskBid為分時買賣力的函數，
	該函數運算出來的數值，與XS指標的「分時買賣力」指標相同。
}

value1 = GetField("外盤量");
value2 = GetField("內盤量");
DiffTradeVolumeAtAskBid = value1 - value2;