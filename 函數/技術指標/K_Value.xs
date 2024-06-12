{@type:function}
SetBarMode(1);

{
XQ: KD指標中的K值
Length:計算期數
RSVt:RSVt權數
}
input: Length(numeric), RSVt(numeric);
variable: _rsv(0), _k(0),_d(0);

Stochastic(Length, RSVt, RSVt, _rsv, _k, _d);

k_value = _k;


		