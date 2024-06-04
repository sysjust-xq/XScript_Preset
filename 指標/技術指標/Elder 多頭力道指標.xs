{@type:indicator|@guid:8c80b8caf0c544a98e6484a688902642|@path:/技術指標/Elder 多頭力道指標|@hash:759dcb63e8f14b52e709ecdda5c2825d}
// Elder 多頭力道指標
//
input: Length(13);

SetInputName(1, "天數");
Value1 = High - XAverage(Close, Length);

Plot1(Value1, "多頭");

        
		