{@type:indicator}
// XQ: VHF指標
//
input: Length(42);
Variable: hp(0), lp(0), numerator(0), denominator(0), _vhf(0);

SetInputName(1, "天數");

hp = highest(Close, Length);
lp = lowest(Close, Length);

numerator = hp - lp;
denominator = Summation(absvalue((Close - Close[1])), Length);

if denominator <> 0 then
	_vhf = numerator / denominator
else
	_vhf = 0;

Plot1(_vhf, "VHF");

        
		