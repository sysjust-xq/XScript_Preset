{@type:function|@guid:328818c303ce4aa6a307cee4c60046b3|@path:/價格關係/HighestBar|@hash:cbf101cd5e1468d400aca0bc915aff04}
SetBarMode(1);

input:thePrice(numericseries); //"價格序列"
input:Length(numericsimple);   //"計算期間"

variable: _Output(0);

Extremes(ThePrice, Length, 1, value1, _Output);

HighestBar = _Output;      