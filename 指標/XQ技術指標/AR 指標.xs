{@type:indicator|@guid:2c13bfea4f9d4190938d0d605b5e1877|@path:/XQ技術指標/AR 指標|@hash:a1df56126a9fff5072db4c738cd1d4b1}
// XQ: AR指標
// 
input: Length(26);
variable: sum(0), ar(0);

SetInputName(1, "天數");

sum = Summation((Open - Low), Length);
if sum <> 0 then
	ar = 100 * Summation((High - Open), length) / sum
else
	ar = ar[1];

Plot1(ar, "AR(%)");

		