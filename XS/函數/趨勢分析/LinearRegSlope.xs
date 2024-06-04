{@type:function|@guid:626e6e5c42304bbea9809d1a07ae4e01|@path:/趨勢分析/LinearRegSlope|@hash:22d8a7d10a3dd988b619be01017ec076}
SetBarMode(1);

input:thePrice(numericseries); //"價格序列"
input:Length(numericsimple);   //"計算期間"

variable: _Output(0);

LinearReg(thePrice, Length, 0, _Output, value2, value3, value4);

LinearRegSlope = _Output;

