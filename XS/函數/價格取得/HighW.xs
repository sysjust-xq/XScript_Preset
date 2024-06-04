{@type:function|@guid:c124dffb6ccf4dd4b3a1b857cd5a336e|@path:/價格取得/HighW|@hash:2e37a09520f78034920dc37c094be95b}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

HighW = GetField("High","W")[PeriodsAgo];
