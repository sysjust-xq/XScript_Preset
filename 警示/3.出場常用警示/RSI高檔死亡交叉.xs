{@type:sensor}
input: Length1(6); SetInputName(1, "短期期數");
input: Length2(12); SetInputName(2, "長期期數");
input: HighBound(75); SetInputName(3, "高檔區");

settotalbar(maxlist(Length1,Length2,6) * 8 + 8);

value1=RSI(close,Length1);
value2=RSI(close,Length2);

if value1 crosses under value2 and value1>HighBound
then ret=1;
