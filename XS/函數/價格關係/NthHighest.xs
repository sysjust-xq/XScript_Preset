{@type:function|@guid:50196492a31d4f42821e72bbd09444ca|@path:/價格關係/NthHighest|@hash:6c651edaffef4e517bca1971773b2187}
SetBarMode(1);

input: N (numericsimple), thePrice(numericseries), Length(numericsimple);
variable: _Output(0);

NthExtremes(thePrice, Length, N, 1, _Output, value2);

NthHighest = _Output;
        