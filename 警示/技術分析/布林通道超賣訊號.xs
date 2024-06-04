{@type:sensor|@guid:049eca86ab7b40b2ae81076e6390fc49|@path:/技術分析/布林通道超賣訊號|@hash:7b598eb8be2856439d712799cc0cd574}
// 布林通道超賣訊號
//
Input: Length(20), LowerBand(2);

settotalbar(Length + 3);

SetInputName(1, "期數");
SetInputName(2, "通道下緣");

Ret = Low <= bollingerband(Close, Length, -1 * LowerBand);



        