{@type:indicator}
// XQ: KDJ指標
//
input: Length(9), RSVt(3), Kt(3), JType(0);
variable: rsv(0), k(0), _d(0), j(0);

SetInputName(1, "天數");
SetInputName(2, "RSVt權數");
SetInputName(3, "Kt權數");

Stochastic(Length, RSVt, Kt, rsv, k, _d);

Plot1(k, "K(%)");
Plot2(_d, "D(%)");

if JType = 0 then
	j = 3 * k - 2 * _d
else
	j = 3 * _d - 2 * k;

Plot3(j, "J(%)");
	
		