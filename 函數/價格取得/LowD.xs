{@type:function|@guid:7513ef4c00b84668bb971542273f8683|@path:/價格取得/LowD|@hash:4bed53dd8f5fbf7201810997ff63cdfa}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

LowD = GetField("Low","D")[PeriodsAgo];
