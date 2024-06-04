{@type:indicator|@guid:9b9363af71bf493babefa40af10dad76|@path:/市場動能/台灣50MTM多方家數|@hash:3ce060cbafc729b72f443e07b44a758c}
{統計台灣50成分股內, Momentum(10) > 0的家數.
Momentum(N) = 目前價格 - N筆資料前的Close。}

value1 = GetSymbolField("TSE50.SJ","TW50MTM多空家數");

plot1(value1,"台灣50MTM多方家數");