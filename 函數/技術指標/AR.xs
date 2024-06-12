{@type:function}
SetBarMode(2);

{
買賣氣勢強度的測試指標。
AR值高時，代表行情很活潑，當AR值介於0.25~1.85間時，屬於盤整行情。AR值低時，表示人氣不足
Length: 計算期數
}
input: Length(numeric);
variable: sum(0), art(0);

sum = Summation((Open - Low), Length);
if sum <> 0 then
	art = 100 * Summation((High - Open), length) / sum
else
	art = art[1];

AR = art;
		