{@type:sensor}
input: Length(5), Percent(3);

settotalbar(3);
setbarback(Length);

SetInputName(1, "計算期數");
SetInputName(2, "累計上漲幅度(%)");

Ret = Rateofchange(Close, Length) > Percent;



