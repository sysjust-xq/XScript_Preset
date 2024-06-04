{@type:function|@guid:c25914dff81b464bb32ed807dd1d4dc5|@path:/價格關係/FastHighestBar}
SetBarMode(1);

input:thePrice(numericseries); //"價格序列"
input:Length(numericsimple);   //"計算期間"

variable: _Output(0);

Extremes(ThePrice, Length, 1, value1, _Output);

FastHighestBar = _Output;