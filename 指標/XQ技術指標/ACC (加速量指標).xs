{@type:indicator}
// XQ: ACC指標
//
input: Length(10);

SetInputName(1, "天數");

value1 = Momentum(Close, Length); 
value2 = Momentum(value1, Length);

Plot1(value2, "ACC");