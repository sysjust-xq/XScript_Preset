{@type:function|@guid:4cae5e8e25a84fea9396d567f7459b8d|@path:/價格取得/HighY|@hash:05c7b1b0afd1fbb3fcdd0a908361674a}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

HighY = GetField("High","Y")[PeriodsAgo];
