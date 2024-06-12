{@type:function}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

OpenQ = GetField("Open","Q")[PeriodsAgo];
