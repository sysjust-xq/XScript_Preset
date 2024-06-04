{@type:indicator|@guid:d22ee6d7d8b24c0b804bbbd1d61f028b|@path:/主圖指標/投資建議目標價|@hash:e365a10597a73d64993b92b1e1324584}
//支援頻率：不定期
//支援商品 ：美(股票)
var:exchange("");
exchange = GetSymbolInfo("交易所");
if exchange <> "NYSE" and exchange <> "NASDAQ" and exchange <> "AMEX" then raiseruntimeerror("僅支援美股");

plot1(getField("投資建議目標價"),"目標價");