{@type:function}
SetBarMode(1);

input: thePrice(numericseries), Length(numericsimple);
variable: _Output(0);

Extremes(thePrice, Length, -1, _Output, value2);

FastLowest = _Output;