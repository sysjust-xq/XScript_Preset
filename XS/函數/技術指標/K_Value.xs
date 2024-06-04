{@type:function|@guid:5f85c227b1ee430981b24d82b50fcec8|@path:/技術指標/K_Value}
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


		