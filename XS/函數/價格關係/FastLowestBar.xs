{@type:function|@guid:9e8b8557026141d697518ba0ba67dcc6|@path:/價格關係/FastLowestBar}
SetBarMode(1);

input:thePrice(numericseries); //"價格序列"
input:Length(numericsimple);   //"計算期間"

variable: _Output(0);

Extremes(ThePrice, Length, -1, value1, _Output);

FastLowestbar = _Output;
        