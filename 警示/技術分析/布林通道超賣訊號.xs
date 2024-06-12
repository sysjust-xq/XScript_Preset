{@type:sensor}
// 布林通道超賣訊號
//
Input: Length(20), LowerBand(2);

settotalbar(Length + 3);

SetInputName(1, "期數");
SetInputName(2, "通道下緣");

Ret = Low <= bollingerband(Close, Length, -1 * LowerBand);



        