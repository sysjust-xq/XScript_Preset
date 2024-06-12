{@type:indicator}
//台指選擇權現貨(TXO00.TF) 的 買賣權未平倉量比率

value1=GetSymbolField("TXO00.TF", "買賣權未平倉量比率");
plot1(value1,"put call ratio");