{@type:indicator}
{統計台灣50成分股, 近10分鐘(買進大單次數+買進特大單次數)的平均值}

value1 = GetSymbolField("TSE50.SJ","TW50大單成交次數");

plot1(value1,"台灣50大單成交次數");