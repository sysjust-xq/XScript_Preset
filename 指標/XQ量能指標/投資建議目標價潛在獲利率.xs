{@type:indicator}
//支援頻率：不定期
//支援商品 ：美(股票)
var:exchange("");
exchange = GetSymbolInfo("交易所");
if exchange <> "NYSE" and exchange <> "NASDAQ" and exchange <> "AMEX" then raiseruntimeerror("僅支援美股");

if getField("投資建議目標價") <> 0 then
value1 = (getField("投資建議目標價")-close)/getField("投資建議目標價")
else value1 = 0;

plot1(value1,"潛在獲利率");