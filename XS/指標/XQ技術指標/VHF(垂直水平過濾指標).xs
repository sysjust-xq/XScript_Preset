{@type:indicator|@guid:757877813d954941b35cbe9da2f6b088|@path:/XQ技術指標/VHF(垂直水平過濾指標)|@hash:0bcf6df96e5debbde50a323c01fa5cba}
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

        
		