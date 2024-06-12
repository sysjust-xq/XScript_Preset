{@type:filter}
input:MinCapital(10);	// 股本(億)

SetInputName(1, "最小股本(億)");

SetTotalBar(3);

Ret = GetField("最新股本") > MinCapital;
