{@type:function}
SetBarMode(1);

{
XQ: DPO指標
Detrended Price Oscillator，「非趨勢價格擺盪」指標
Length: 計算期數
}

input: Length(numeric);

DPO = Close - Average(Close, Length)[(Length /2) + 1];

		