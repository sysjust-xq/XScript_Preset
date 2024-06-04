{@type:indicator|@guid:28c422b09d2345c2983282d68f3210f6|@path:/XQ量能指標/投資建議目標價潛在獲利率|@hash:7242bbbd205fc151f00603fa5fffed93}
//支援頻率：不定期
//支援商品 ：美(股票)
var:exchange("");
exchange = GetSymbolInfo("交易所");
if exchange <> "NYSE" and exchange <> "NASDAQ" and exchange <> "AMEX" then raiseruntimeerror("僅支援美股");

if getField("投資建議目標價") <> 0 then
value1 = (getField("投資建議目標價")-close)/getField("投資建議目標價")
else value1 = 0;

plot1(value1,"潛在獲利率");