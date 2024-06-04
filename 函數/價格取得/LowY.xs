{@type:function|@guid:04e30169732b43cc929ab8e68f259be2|@path:/價格取得/LowY|@hash:ea9210073381484b97f59e00848defb6}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

LowY = GetField("Low","Y")[PeriodsAgo];
