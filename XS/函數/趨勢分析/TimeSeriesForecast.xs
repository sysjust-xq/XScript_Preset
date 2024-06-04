{@type:function|@guid:911d793dc7c142c4a0c3eb4f8d22bad2|@path:/趨勢分析/TimeSeriesForecast|@hash:c2b832f0ca66b39d0cf1621f6cddfee9}
SetBarMode(1);

input: thePrice(numericseries), Length(numericsimple), TgtBar(numericsimple);
variable: _Output(0);

LinearReg(thePrice, Length, TgtBar, value1, value2, value3, _Output);

TimeSeriesForecast = _Output;
        