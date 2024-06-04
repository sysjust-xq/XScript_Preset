{@type:filter|@guid:de38ff5f10064ea89ed49a7edd7cfb02|@path:/01.常用過濾條件/過濾小型股票|@hash:7bc1526e909ee6fb78541a1b27344615}
input:MinCapital(10);	// 股本(億)

SetInputName(1, "最小股本(億)");

SetTotalBar(3);

Ret = GetField("最新股本") > MinCapital;
