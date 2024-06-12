{@type:function}
SetBarMode(1);

{
 XQ: MA-Osc :移動平均線擺盪指標。將兩條不同天期的簡單移動平均線相減即得
 Length1:第1條平均線期數
 Length2:第2條平均線期數
}
input: Length1(numeric), Length2(numeric);

value1 = Average(close, Length1);
value2 = Average(close, Length2);
value3 = (value1 - value2);

ma_osc = value3;

		