{@type:indicator|@guid:f6a85ca8e7c74e609013194bce598f9c|@path:/市場動能/台灣50創新低家數|@hash:8733678c95c8b313a5d27380fd2bc329}
{統計台灣50成分股, 最低價創近20期新低的家數。}

value1 = GetSymbolField("TSE50.SJ","TW50創新低家數");

plot1(value1,"台灣50創新低家數");