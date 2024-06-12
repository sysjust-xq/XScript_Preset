{@type:indicator}
{統計台灣50成分股內, 目前股價大於10期簡單移動均線之上的家數。}

value1 = GetSymbolField("TSE50.SJ","TW50均線多空家數");

plot1(value1,"台灣50均線多方家數");