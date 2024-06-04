{@type:function|@guid:61b7479e4304402c83419e5e14e287ba|@path:/價格取得/HighD|@hash:ec9d42096771562f8df00af192e25447}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

HighD = GetField("High","D")[PeriodsAgo];
