{@type:indicator}
{支援頻率：日、週、月}
{支援商品：美(股票)}

if barfreq <> "d" and barfreq <> "w" and barfreq <> "m" then raiseruntimeerror("不支援此頻率");

var:exchange("");
exchange = GetSymbolInfo("交易所");
if exchange <> "NYSE" and exchange <> "NASDAQ" and exchange <> "AMEX" then raiseruntimeerror("僅支援美股");

plot1(Getfield("內部人持股異動"),"內部人持股異動",Checkbox:=1);//計算內部人的交易總股數
plot2(Getfield("內部人持股"),"內部人持股",Checkbox:=0);//計算有持股異動的內部人總股數