{@type:function|@guid:a7ae69ad0e2c4621aa19f0292d82f23f|@path:/技術指標/ERC}
SetBarMode(1);

{
RC指標變動率的移動平均值(ERC)
Length: 計算期數
EMALength: 平滑期數
}
input: Length(numeric), EMALength(numeric);

if Close[Length] > 0 then
  value1 = (Close - Close[Length]) / Close[Length];

ERC = XAverage(value1, EMALength);

		