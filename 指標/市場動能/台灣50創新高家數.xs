{@type:indicator|@guid:1fea465cc4d244599f80c82dce912b70|@path:/市場動能/台灣50創新高家數|@hash:b3dc98eec6248d5f91a32c30a6370acd}
{統計台灣50成分股，最高價創近20期新高的家數。}

value1 = GetSymbolField("TSE50.SJ","TW50創新高家數");

plot1(value1,"台灣50創新高家數");