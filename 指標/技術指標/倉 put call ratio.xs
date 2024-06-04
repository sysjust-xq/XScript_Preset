{@type:indicator|@guid:cfc5c32bb0ce45da8f57d0abba816075|@path:/技術指標/倉 put call ratio|@hash:2871c248930fe037ae0d4f35a958db24}
//台指選擇權現貨(TXO00.TF) 的 買賣權未平倉量比率

value1=GetSymbolField("TXO00.TF", "買賣權未平倉量比率");
plot1(value1,"put call ratio");