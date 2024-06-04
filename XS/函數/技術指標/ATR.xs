{@type:function|@guid:e8e5ac3753db447abac5b44618fa7dc8|@path:/技術指標/ATR}
SetBarMode(1);

{
傳回平均真實區間
Length: 計算期數
}
input: Length(numeric);
ATR = Average(TrueRange, Length);


		