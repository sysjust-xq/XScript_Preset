{@type:indicator}
// XQ: RSI指標
//
input: Length1(6), Length2(12);

SetInputName(1, "天數一");
SetInputName(2, "天數二");

Plot1(RSI(Close, Length1), "RSI1");
Plot2(RSI(Close, Length2), "RSI2");

        
		