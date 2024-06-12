{@type:function}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

CloseD = GetField("Close","D")[PeriodsAgo];
