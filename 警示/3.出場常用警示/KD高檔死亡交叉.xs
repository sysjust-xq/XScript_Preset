{@type:sensor}
input: Length(9), RSVt(3), Kt(3), HighBound(75);

SetTotalBar(maxlist(Length,6) * 3 + 8);

SetInputName(1, "計算期數");
SetInputName(2, "RSVt權數");
SetInputName(3, "Kt權數");
setInputName(4, "高檔區");

variable: rsv(0), k(0), _d(0);

Stochastic(Length, RSVt, Kt, rsv, k, _d);

if k>HighBound and k crosses under _d
then ret=1;
