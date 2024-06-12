{@type:indicator}
// XQ: RSV指標
//
input: Length(9);
variable: RSVt(3), Kt(3), rsv(0), k(0), _d(0);

SetInputName(1, "天數");

Stochastic(Length, RSVt, Kt, rsv, k, _d);

Plot1(rsv, "RSV(%)");
		