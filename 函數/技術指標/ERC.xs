{@type:function}
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

		