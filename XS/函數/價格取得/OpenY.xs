{@type:function|@guid:bdbfc7fd08d34ac39e02a0dfb37d6054|@path:/價格取得/OpenY|@hash:696d29148dad6ec548d074457d083d12}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

OpenY = GetField("Open","Y")[PeriodsAgo];
