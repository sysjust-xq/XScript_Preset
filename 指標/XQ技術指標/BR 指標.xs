{@type:indicator}
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
		