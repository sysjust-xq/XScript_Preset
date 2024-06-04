{@type:function|@guid:edd5eaeb76034fd388aea89f0d1acdf4|@path:/價格取得/CloseW|@hash:ab58e840757aed386d492cd5f64abfc2}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

CloseW = GetField("Close","W")[PeriodsAgo];
