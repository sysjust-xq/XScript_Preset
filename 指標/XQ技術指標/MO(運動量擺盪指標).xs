{@type:indicator|@guid:85959a36be5d439b913c1384fbd2d243|@path:/XQ技術指標/MO(運動量擺盪指標)|@hash:89e03941ed141e03cf7141692ab90fd5}
// XQ: MO指標
//
input: Length(10);
variable: mo(0);

SetInputName(1, "天數");

mo = 100 * Close / Close[Length];

Plot1(mo, "MO");
		