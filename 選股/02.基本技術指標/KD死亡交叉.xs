{@type:filter|@guid:ef1ad1fa22d8455ab2e01c9eb42864fe|@path:/02.基本技術指標/KD死亡交叉|@hash:a0e28e970f3e12f2a4623e4003c5d1dc}
// KD指標, K值由上往下穿越D值
//
input: Length(9), RSVt(3), Kt(3);
variable: rsv(0), k(0), _d(0);

SetTotalBar(maxlist(Length,6) * 3);

SetInputName(1, "天數");
SetInputName(2, "RSVt權數");
SetInputName(3, "Kt權數");

Stochastic(Length, RSVt, Kt, rsv, k, _d);

Ret = k crosses below _d;
