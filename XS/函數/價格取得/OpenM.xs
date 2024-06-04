{@type:function|@guid:425c070d041643dcbb267162e768ae6f|@path:/價格取得/OpenM|@hash:a432f204da82a840c71be9d6da09e259}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

OpenM = GetField("Open","M")[PeriodsAgo];
