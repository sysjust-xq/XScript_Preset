{@type:indicator}
// XQ: 快速KD指標
//
input: Length(9), RSVt(3);
variable: rsv(0), k(0), _d(0);

SetInputName(1, "天數");
SetInputName(2, "RSVt權數");

Stochastic(Length, RSVt, 3, rsv, k, _d);

Plot1(rsv, "K(%)");
Plot2(k, "D(%)");
		