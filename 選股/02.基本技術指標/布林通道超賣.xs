{@type:filter}
// 布林通道超賣訊號
//
Input: Length(20), LowerBand(2);

SetInputName(1, "期數");
SetInputName(2, "通道下緣");

settotalbar(3);

Ret = Low <= bollingerband(Close, Length, -1 * LowerBand);



        