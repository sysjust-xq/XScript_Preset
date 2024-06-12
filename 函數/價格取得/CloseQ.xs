{@type:function}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

CloseQ = GetField("Close","Q")[PeriodsAgo];
