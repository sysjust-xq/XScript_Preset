{@type:function|@guid:5fc5395e45f8445881703c142fc4e51d|@path:/價格取得/OpenD|@hash:b8d80abbedcba13d68afefe86d1547f6}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

OpenD = GetField("Open","D")[PeriodsAgo];
