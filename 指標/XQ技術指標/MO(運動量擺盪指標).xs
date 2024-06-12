{@type:indicator}
// XQ: MO指標
//
input: Length(10);
variable: mo(0);

SetInputName(1, "天數");

mo = 100 * Close / Close[Length];

Plot1(mo, "MO");
		