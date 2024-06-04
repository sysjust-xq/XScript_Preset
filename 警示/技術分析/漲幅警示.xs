{@type:sensor|@guid:39a0b049715946b6a186197bcc941ee9|@path:/技術分析/漲幅警示|@hash:f721e38b82148093b6ba61f2c615f111}
input: Length(5), Percent(3);

settotalbar(3);
setbarback(Length);

SetInputName(1, "計算期數");
SetInputName(2, "累計上漲幅度(%)");

Ret = Rateofchange(Close, Length) > Percent;



