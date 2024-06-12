{@type:indicator}
{統計台灣50成分股, 趨勢向上的家數.
趨勢向上的定義是計算近6根K棒(含當前這一根K棒)的線性回歸線是否向上}

value1 = GetSymbolField("TSE50.SJ","TW50上昇趨勢家數");

plot1(value1,"台灣50上昇趨勢家數");