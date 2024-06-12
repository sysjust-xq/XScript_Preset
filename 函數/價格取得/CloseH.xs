{@type:function}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

CloseH = GetField("Close","H")[PeriodsAgo];
