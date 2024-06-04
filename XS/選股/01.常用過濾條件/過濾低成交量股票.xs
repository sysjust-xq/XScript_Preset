{@type:filter|@guid:54f825a88c8f4d89902d6c3c27a4e907|@path:/01.常用過濾條件/過濾低成交量股票|@hash:d1706d48dc7b0bb2489223f4c0808600}
input:Length(5);
input:VolumeLimit(500);
 
SetInputName(1, "均量天期");
SetInputName(2, "最小均量");

SetTotalBar(3);

Value1 = Average(volume, Length);
Ret = Value1 > VolumeLimit;

SetOutputName1("成交均量");
OutputField1(Value1);