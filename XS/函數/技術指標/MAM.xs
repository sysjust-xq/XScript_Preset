{@type:function|@guid:cfe08ebf5f0b4dce844d7fda7dfe2bd9|@path:/技術指標/MAM}
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

		