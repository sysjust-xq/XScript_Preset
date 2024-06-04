{@type:filter|@guid:8706ccc94c0148e7b274a222bba3cf28|@path:/02.基本技術指標/KD黃金交叉|@hash:26ad72876db33773b5d3f3cb234a0d07}
// KD指標, K值由下往上穿越D值
//
input: Length(9), RSVt(3), Kt(3);
variable: rsv(0), k(0), _d(0);

SetTotalBar(maxlist(Length,6) * 3);

SetInputName(1, "天數");
SetInputName(2, "RSVt權數");
SetInputName(3, "Kt權數");

Stochastic(Length, RSVt, Kt, rsv, k, _d);

Ret = k crosses above _d;
