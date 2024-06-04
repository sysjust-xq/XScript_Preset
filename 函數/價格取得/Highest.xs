{@type:function|@guid:2bca774c6b7549c1b0b008d2a54b288e|@path:/價格取得/Highest|@hash:80a9a7bf1f6e26919eaa0300e424189c}
SetBarMode(1);

input: thePrice(numericseries),Length(numericsimple);

variable: _Output(0);

Extremes(thePrice, Length, 1, _Output, value2);

Highest = _Output;