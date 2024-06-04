{@type:function|@guid:f3afaf702e184617835de9bd8b9af3b3|@path:/技術指標/DPO}
SetBarMode(1);

{
XQ: DPO指標
Detrended Price Oscillator，「非趨勢價格擺盪」指標
Length: 計算期數
}

input: Length(numeric);

DPO = Close - Average(Close, Length)[(Length /2) + 1];

		