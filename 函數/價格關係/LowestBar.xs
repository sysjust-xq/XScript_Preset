{@type:function|@guid:68349c444a9c43f09b19def4bddc206e|@path:/價格關係/LowestBar|@hash:3d5b8596bfe08976a1595a8f3a351cf5}
SetBarMode(1);

input:thePrice(numericseries); //"價格序列"
input:Length(numericsimple);   //"計算期間"

variable: _Output(0);

Extremes(ThePrice, Length, -1, value1, _Output);

Lowestbar = _Output;