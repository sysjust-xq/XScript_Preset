{@type:indicator}
{統計台灣50成分股內, Momentum(10) > 0的家數.
Momentum(N) = 目前價格 - N筆資料前的Close。}

value1 = GetSymbolField("TSE50.SJ","TW50MTM多空家數");

plot1(value1,"台灣50MTM多方家數");