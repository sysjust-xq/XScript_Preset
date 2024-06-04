{@type:indicator|@guid:bcf25753f9874dff91f1151fd893ca9f|@path:/市場動能/台灣50上漲家數|@hash:c26ea978c0716e01c0527664c675e699}
{統計台灣50成分股，這一根K棒上漲的家數。
K棒上漲的定義為，目前收盤價 > 前一根K棒的收盤價}

value1 = GetSymbolField("TSE50.SJ","TW50價格上漲家數");

plot1(value1,"台灣50上漲家數");