{@type:function|@guid:6bbc72256c3d4dbd9c7b3abd21a0be15|@path:/價格關係/NthLowestBar|@hash:a4f1c760a98b0660d5e1957fb66b7549}
SetBarMode(1);

input: N (numericsimple), thePrice(numericseries), Length(numericsimple);
variable: _Output(0);

NthExtremes(thePrice, Length, N, -1, value1, _Output);

NthLowestBar = _Output;
        