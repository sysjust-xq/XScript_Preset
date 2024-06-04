{@type:indicator|@guid:5e80c43ca0744942ad4fe7fbe8cbea50|@path:/市場動能/台灣50上昇趨勢家數|@hash:c452efb76a505a8c029b8942d7116ebc}
{統計台灣50成分股, 趨勢向上的家數.
趨勢向上的定義是計算近6根K棒(含當前這一根K棒)的線性回歸線是否向上}

value1 = GetSymbolField("TSE50.SJ","TW50上昇趨勢家數");

plot1(value1,"台灣50上昇趨勢家數");