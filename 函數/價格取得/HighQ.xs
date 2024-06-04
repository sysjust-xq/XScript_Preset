{@type:function|@guid:b77392250361472c8c4b7fc3f5fddeeb|@path:/價格取得/HighQ|@hash:163ed02364955336de796b9fe4a34d9d}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

HighQ = GetField("High","Q")[PeriodsAgo];
