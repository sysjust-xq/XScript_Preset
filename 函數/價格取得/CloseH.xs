{@type:function|@guid:93dadf093e044579b295f9d2b7b6dd1d|@path:/價格取得/CloseH|@hash:fe7ea8e6d7c93f27803ade258e66337f}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

CloseH = GetField("Close","H")[PeriodsAgo];
