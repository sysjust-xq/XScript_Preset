{@type:function}
SetBarMode(2);

{
XQ: VHF指標
Length: 計算期數
}
input: Length(numeric);
Variable: hp(0), lp(0), numerator(0), denominator(0), VHFt(0);

hp = highest(Close, Length);
lp = lowest(Close, Length);

numerator = hp - lp;
denominator = Summation(absvalue((Close - Close[1])), Length);

if denominator <> 0 then
	VHFt = numerator / denominator
else
	VHFt = 0;

VHF = VHFt;

		