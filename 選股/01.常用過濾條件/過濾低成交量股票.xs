{@type:filter}
input:Length(5);
input:VolumeLimit(500);
 
SetInputName(1, "均量天期");
SetInputName(2, "最小均量");

SetTotalBar(3);

Value1 = Average(volume, Length);
Ret = Value1 > VolumeLimit;

SetOutputName1("成交均量");
OutputField1(Value1);