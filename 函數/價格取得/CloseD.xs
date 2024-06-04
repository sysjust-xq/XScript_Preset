{@type:function|@guid:e53a55e6d49b466da1125c878df9cf9a|@path:/價格取得/CloseD|@hash:0a5c0d260ac15012c92b920fab6a6576}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

CloseD = GetField("Close","D")[PeriodsAgo];
