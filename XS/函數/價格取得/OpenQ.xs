{@type:function|@guid:f23675d8fad74871bd7274807fb654a6|@path:/價格取得/OpenQ|@hash:2a71554dfb4c98bd4fc3ba073d2ad081}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

OpenQ = GetField("Open","Q")[PeriodsAgo];
