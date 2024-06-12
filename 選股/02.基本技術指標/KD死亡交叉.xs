{@type:filter}
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
