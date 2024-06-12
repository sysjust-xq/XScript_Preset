{@type:function}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

CloseM = GetField("Close","M")[PeriodsAgo];
