{@type:function}
SetBarMode(1);

{
傳回平均真實區間
Length: 計算期數
}
input: Length(numeric);
ATR = Average(TrueRange, Length);


		