{@type:indicator}
{統計台灣50成分股，最高價創近20期新高的家數。}

value1 = GetSymbolField("TSE50.SJ","TW50創新高家數");

plot1(value1,"台灣50創新高家數");