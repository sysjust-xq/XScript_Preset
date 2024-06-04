{@type:indicator|@guid:9c6c2dafc89443bc9e7c05592f6b8509|@path:/XQ技術指標/PSY 心理線|@hash:2ad6795aeb323ef8e128a47d1e59550c}
// XQ: 心理線
//
input: Length1(12), Length2(24);

SetInputName(1, "天數一");
SetInputName(2, "天數二");

Value1 = 100 * CountIf(Close > Close[1], Length1) / Length1;
Value2 = 100 * CountIf(Close > Close[1], Length2) / Length2;

Plot1(Value1, "PSY1");
Plot2(Value2, "PSY2");


        
		