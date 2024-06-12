{@type:function}
SetBarMode(1);

input: thePrice(numericseries), Length(numericsimple), TgtBar(numericsimple);
variable: _Output(0);

LinearReg(thePrice, Length, TgtBar, value1, value2, value3, _Output);

TimeSeriesForecast = _Output;
        