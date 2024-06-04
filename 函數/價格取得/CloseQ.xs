{@type:function|@guid:55b090afcf794843ae857472b94feb59|@path:/價格取得/CloseQ|@hash:4e833b9d3d72af829bdd63bf2bd1d9e9}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

CloseQ = GetField("Close","Q")[PeriodsAgo];
