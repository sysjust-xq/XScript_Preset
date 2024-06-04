{@type:indicator|@guid:f84c684f920e4973ba63ced2fde49a03|@path:/XQ技術指標/BR 指標|@hash:6617853b07b4be75f11a97eb10252005}
// XQ BR指標
//
input: Length(26);
variable: sum(0), _br(0);

SetInputName(1, "天數");

sum= Summation((Close[1] - Low), length);
if sum <> 0 then
	_br = 100 * Summation((High - Close[1]), length) / sum
else
	_br = _br[1];

Plot1(_br, "BR(%)");
		