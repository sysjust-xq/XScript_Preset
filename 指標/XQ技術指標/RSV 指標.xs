{@type:indicator|@guid:b8da5fc094684f74afe8f6f50abae064|@path:/XQ技術指標/RSV 指標|@hash:8f654300aafbeffe9d0b1721bfc36a00}
// XQ: RSV指標
//
input: Length(9);
variable: RSVt(3), Kt(3), rsv(0), k(0), _d(0);

SetInputName(1, "天數");

Stochastic(Length, RSVt, Kt, rsv, k, _d);

Plot1(rsv, "RSV(%)");
		