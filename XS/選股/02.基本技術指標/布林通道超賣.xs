{@type:filter|@guid:dcdc0d809aab49689e977cd80f446c9a|@path:/02.基本技術指標/布林通道超賣|@hash:ada76d283316a9f2047c4720551f21f3}
// 布林通道超賣訊號
//
Input: Length(20), LowerBand(2);

SetInputName(1, "期數");
SetInputName(2, "通道下緣");

settotalbar(3);

Ret = Low <= bollingerband(Close, Length, -1 * LowerBand);



        