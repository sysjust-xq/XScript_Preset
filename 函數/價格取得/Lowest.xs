{@type:function|@guid:f1b429ac13b2447c909302198c18ca56|@path:/價格取得/Lowest|@hash:3473540eaf8bf7000b127690cbefc478}
SetBarMode(1);

input: thePrice(numericseries), Length(numericsimple);

variable: _Output(0);

Extremes(thePrice, Length, -1, _Output, value2);

Lowest = _Output;        