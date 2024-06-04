{@type:function|@guid:cce2b31acb5e4376bf56c9cf7f3b084f|@path:/價格取得/LowH|@hash:ce3cf94a1936686f05743ded6db797e7}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

LowH = GetField("Low","H")[PeriodsAgo];
