{@type:function|@guid:abfcfbcbfa034f4db9f09160d8c1a85c|@path:/價格取得/CloseY|@hash:4c9a3d7f8918ed1a94ffaa337dccce24}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

CloseY = GetField("Close","Y")[PeriodsAgo];
