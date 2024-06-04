{@type:indicator|@guid:e8e5e6feb64b4b2ea3414ac0221ae28d|@path:/XQ技術指標/快速KD 隨機指標|@hash:290e8b45a6855885a75d37678f3e6563}
// XQ: 快速KD指標
//
input: Length(9), RSVt(3);
variable: rsv(0), k(0), _d(0);

SetInputName(1, "天數");
SetInputName(2, "RSVt權數");

Stochastic(Length, RSVt, 3, rsv, k, _d);

Plot1(rsv, "K(%)");
Plot2(k, "D(%)");
		