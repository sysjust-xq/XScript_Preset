{@type:function|@guid:7b6d505467f34b67aff3816cf394d90c|@path:/趨勢分析/LinearRegAngle|@hash:8c9381b0e2c233e0aa9cd9844d1fb404}
SetBarMode(1);

input:thePrice(numericseries); //"價格序列"
input:Length(numericsimple);   //"計算期間"

variable: _Output(0);

LinearReg(thePrice, Length, 0, value1, _Output, value3, value4);

LinearRegAngle = _Output;
        