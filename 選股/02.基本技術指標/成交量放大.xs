{@type:filter|@guid:c5da72c091c64cb98378aa6cbe832022|@path:/02.基本技術指標/成交量放大|@hash:67bac54bc2802836dea11e7ce1e749cb}
input: Length(5), VolFactor(2);

SetInputName(1, "均量區間");
SetInputName(2, "放大倍數");

settotalbar(3);

Ret = Volume > Average(Volume[1], Length) * VolFactor;
