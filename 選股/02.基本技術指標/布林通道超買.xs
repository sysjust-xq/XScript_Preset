{@type:filter|@guid:8a60fdb6f5064c88b39cba273e29041b|@path:/02.基本技術指標/布林通道超買|@hash:554747d67437f6d5c8714343868bf723}
// 布林通道超買訊號
//
Input: Length(20), UpperBand(2);

SetInputName(1, "期數");
SetInputName(2, "通道上緣");

settotalbar(3);

Ret = High >= bollingerband(Close, Length, UpperBand);



