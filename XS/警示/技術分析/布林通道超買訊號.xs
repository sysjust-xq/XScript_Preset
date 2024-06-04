{@type:sensor|@guid:cbafe049806e40f3b0e0257ccb50f4a6|@path:/技術分析/布林通道超買訊號|@hash:728aac0eb233e75af0017ff3a7931d9e}
// 布林通道超買訊號
//
Input: Length(20), UpperBand(2);

settotalbar(Length + 3);

SetInputName(1, "期數");
SetInputName(2, "通道上緣");

Ret = High >= bollingerband(Close, Length, UpperBand);



