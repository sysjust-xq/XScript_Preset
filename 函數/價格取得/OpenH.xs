{@type:function|@guid:38061e022c014bb2b2ba9588411554a7|@path:/價格取得/OpenH|@hash:21292936ff6c8142cd20a8d57baea0a0}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

OpenH = GetField("Open","H")[PeriodsAgo];
