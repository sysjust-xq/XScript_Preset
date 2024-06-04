{@type:function|@guid:f46c2e624f7747469552f7f3f8e52d44|@path:/價格取得/HighH|@hash:cdce442809a3be4d8fca7e5adfb17187}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

HighH = GetField("High","H")[PeriodsAgo];
