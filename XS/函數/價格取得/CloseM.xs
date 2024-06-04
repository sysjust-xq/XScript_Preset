{@type:function|@guid:98b4853f376f423c9bdae8f6091ab3f6|@path:/價格取得/CloseM|@hash:6cee02bce73b3c8020f70eb3b4cd1e1c}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

CloseM = GetField("Close","M")[PeriodsAgo];
