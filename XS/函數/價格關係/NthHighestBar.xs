{@type:function|@guid:de75aec76c414cb0b78812a623b506e8|@path:/價格關係/NthHighestBar|@hash:bf4c93d5fe8e0b4156481b0d2933e1ca}
SetBarMode(1);

input: N (numericsimple), thePrice(numericseries), Length(numericsimple);
variable: _Output(0);

NthExtremes(thePrice, Length, N, 1, value1, _Output);

NthHighestBar = _Output;
        