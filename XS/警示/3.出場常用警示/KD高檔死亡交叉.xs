{@type:sensor|@guid:8ac84a27abb743bd82f5fdd7b7179799|@path:/3.出場常用警示/KD高檔死亡交叉|@hash:9a884c721f2930ef5dd3b179e4aa3b07}
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
