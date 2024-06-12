{@type:function}
SetBarMode(1);

input:thePrice(numericseries); //"價格序列"
input:Length(numericsimple);   //"計算期間"

variable: _Output(0);

LinearReg(thePrice, Length, 0, _Output, value2, value3, value4);

LinearRegSlope = _Output;

