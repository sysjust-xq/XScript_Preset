{@type:filter|@guid:d0fd82b8aab54745ba76f1f847c1b07b|@path:/01.常用過濾條件/過濾冷門股票|@hash:cecdf1d7177c169e9de6c93cc4016db9}
input:PriceLimit(5),Length(5), VolumeLimit(500);

SetInputName(1, "最小股價");
SetInputName(2, "均量天期");
SetInputName(3, "最小均量");

SetTotalBar(3);

Value1 = Average(volume,Length);
if close > PriceLimit and Value1 > VolumeLimit Then
ret = 1;

