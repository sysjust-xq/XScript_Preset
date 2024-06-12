{@type:function}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

CloseY = GetField("Close","Y")[PeriodsAgo];
