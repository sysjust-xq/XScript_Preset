{@type:function|@guid:68d1f6cac97441e8aae708fb49ab31a0|@path:/價格取得/FastHighest}
SetBarMode(1);

input: thePrice(numericseries),Length(numericsimple);

variable: _Output(0);

Extremes(thePrice, Length, 1, _Output, value2);

FastHighest = _Output;
        