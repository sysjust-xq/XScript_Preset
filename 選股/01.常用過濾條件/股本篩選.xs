{@type:filter|@guid:8cb4bf9857d94f6d984e340512823278|@path:/01.常用過濾條件/股本篩選|@hash:95d4ee82d917abb55cf11f3ff0c5181d}
input:MinCapital(10);
input:MaxCapital(50); 

SetInputName(1, "最小股本(億)");
SetInputName(2, "最大股本(億)");

SetTotalBar(3);

Value1 = GetField("最新股本");

// 介於兩者之間
Ret = Value1 >= MinCapital and Value1 <= MaxCapital;


