{@type:function|@guid:8fd84bf20efa49ce9c588c3bec5c8d42|@path:/價格取得/LowW|@hash:fc1f845c520e64f07efbd4162ccc5cee}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

LowW = GetField("Low","W")[PeriodsAgo];
