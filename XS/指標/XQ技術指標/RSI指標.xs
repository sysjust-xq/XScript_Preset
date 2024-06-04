{@type:indicator|@guid:5755c0fea5ff4dd49a60eb3c31e4f2da|@path:/XQ技術指標/RSI指標|@hash:989d17b13bebff5cf27177f2aafd6083}
// XQ: RSI指標
//
input: Length1(6), Length2(12);

SetInputName(1, "天數一");
SetInputName(2, "天數二");

Plot1(RSI(Close, Length1), "RSI1");
Plot2(RSI(Close, Length2), "RSI2");

        
		