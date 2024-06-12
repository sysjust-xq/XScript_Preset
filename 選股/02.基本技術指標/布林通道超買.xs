{@type:filter}
// 布林通道超買訊號
//
Input: Length(20), UpperBand(2);

SetInputName(1, "期數");
SetInputName(2, "通道上緣");

settotalbar(3);

Ret = High >= bollingerband(Close, Length, UpperBand);



