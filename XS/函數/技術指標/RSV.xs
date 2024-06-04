{@type:function|@guid:8fc14acbedda4e7b86a6095eea9357d9|@path:/技術指標/RSV}
SetBarMode(1);

{
XQ: RSV指標 Raw Stochastic Value
Length: 計算期數
}
input: Length(numeric);
variable: RSVt(3), Kt(3), rsvx(0), k(0), _d(0);

Stochastic(Length, RSVt, Kt, rsvx, k, _d);

RSV =rsvx;
		