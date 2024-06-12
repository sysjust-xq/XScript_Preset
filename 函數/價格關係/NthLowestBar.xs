{@type:function}
SetBarMode(1);

input: N (numericsimple), thePrice(numericseries), Length(numericsimple);
variable: _Output(0);

NthExtremes(thePrice, Length, N, -1, value1, _Output);

NthLowestBar = _Output;
        