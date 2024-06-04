{@type:function|@guid:9565ee69fed14076aca3032a907ae0a3|@path:/價格取得/OpenW|@hash:890676ab71f364524b2b238410490055}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

OpenW = GetField("Open","W")[PeriodsAgo];
