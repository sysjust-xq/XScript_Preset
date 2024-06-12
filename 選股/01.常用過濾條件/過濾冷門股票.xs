{@type:filter}
input:PriceLimit(5),Length(5), VolumeLimit(500);

SetInputName(1, "最小股價");
SetInputName(2, "均量天期");
SetInputName(3, "最小均量");

SetTotalBar(3);

Value1 = Average(volume,Length);
if close > PriceLimit and Value1 > VolumeLimit Then
ret = 1;

