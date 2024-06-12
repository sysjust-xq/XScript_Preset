{@type:function}
SetBarMode(2);

{
 XQ: MAM指標 :當日所計算出移動平均值減去n日前的移動平均值
 Length:計算平均期數
 Distance:相隔期間
}
Input: Length(numeric), Distance(numeric);

Value1 = Average(Close, Length);
Value2 = Average(Close, Length)[Distance];

MAM = Value1 - Value2;

		