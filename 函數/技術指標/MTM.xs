{@type:function}
SetBarMode(1);

{
以收盤價計算的運動量指標
Length: 計算期數
}
input: Length(numeric);

MTM = Momentum(Close, Length);



		