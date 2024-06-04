{@type:function|@guid:d69c0ba18dd04e2498a8d58cd08f9a73|@path:/價格取得/HighM|@hash:2e4066ab63dde694a1a3785f3c695a4d}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

HighM = GetField("High","M")[PeriodsAgo];
