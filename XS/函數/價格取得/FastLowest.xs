{@type:function|@guid:804e2b79d5ac4c0e9109df69f1c5f4ca|@path:/價格取得/FastLowest}
SetBarMode(1);

input: thePrice(numericseries), Length(numericsimple);
variable: _Output(0);

Extremes(thePrice, Length, -1, _Output, value2);

FastLowest = _Output;