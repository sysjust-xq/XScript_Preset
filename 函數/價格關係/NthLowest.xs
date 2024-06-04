{@type:function|@guid:f44858c38f4249558a8b2ac032207f15|@path:/價格關係/NthLowest|@hash:9db389e5c3c1c8c18e15e79c8d84a39a}
SetBarMode(1);

input: N (numericsimple), thePrice(numericseries), Length(numericsimple);
variable: _Output(0);

NthExtremes(thePrice, Length, N, -1, _Output, value2);

NthLowest = _Output;
        