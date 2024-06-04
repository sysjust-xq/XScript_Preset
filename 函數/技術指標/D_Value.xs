{@type:function|@guid:bd7a0b57d6404f7bbf48472833389d04|@path:/技術指標/D_Value}
SetBarMode(1);

{
XQ: KD指標中的D值
Length:計算期數
Kt:Kt權數
}
input: Length(numeric), Kt(numeric);
variable:_rsv(0), _k(0), _d(0);

Stochastic(Length, Kt, Kt, _rsv, _k, _d);

D_value = _d;


		