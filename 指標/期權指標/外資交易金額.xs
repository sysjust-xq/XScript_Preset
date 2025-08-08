{@type:indicator}
if symbolType<>3 and symbolType<>5 then raiseRunTimeError("僅支援期權");
if SymbolExchange <> "TF" then raiseRunTimeError("僅支援台灣市場");
if barFreq<>"d" then raiseRunTimeError("僅支援日線");

value1 = getField("外資交易買進金額");
value2 = getField("外資交易賣出金額");
value3 = value1 - value2;

plot1(value1,"外資交易買進金額");
plot2(value2,"外資交易賣出金額");
plot3(value3,"外資交易淨額");