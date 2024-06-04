{@type:function|@guid:670ecff83b7e4c19a75c4a0bcd0db093|@path:/價格取得/LowQ|@hash:6bd4120a7d995449741935a0406ca199}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

LowQ = GetField("Low","Q")[PeriodsAgo];
