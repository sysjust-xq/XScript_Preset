{@type:function}
SetBarMode(1);

{
ACC加速量指標(Acceleration)，用來觀察行情價格變化的加速度幅度，
是MOM運動量指標的再一次計算，使用收盤價，並以相同期間長度計算
Length: 計算期數
}

input: Length(numeric);

value1 = Momentum(Close, Length);
value2 = Momentum(value1, Length);

ACC =value2;
		