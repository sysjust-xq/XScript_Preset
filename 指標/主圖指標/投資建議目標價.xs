{@type:indicator}
//支援頻率：不定期
//支援商品 ：美(股票)
var:exchange("");
exchange = GetSymbolInfo("交易所");
if exchange <> "NYSE" and exchange <> "NASDAQ" and exchange <> "AMEX" then raiseruntimeerror("僅支援美股");

plot1(getField("投資建議目標價"),"目標價");