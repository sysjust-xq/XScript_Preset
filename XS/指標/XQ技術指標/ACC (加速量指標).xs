{@type:indicator|@guid:2d837802ffa84755a7a43b54bb5ecd1b|@path:/XQ技術指標/ACC (加速量指標)|@hash:7b753220209cf4109a0cef91cc63f614}
// XQ: ACC指標
//
input: Length(10);

SetInputName(1, "天數");

value1 = Momentum(Close, Length); 
value2 = Momentum(value1, Length);

Plot1(value2, "ACC");