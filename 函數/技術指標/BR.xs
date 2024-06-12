{@type:function}
SetBarMode(2);

{
BR買賣願指標:買賣行情雙方力道強弱的參考指標
當BR指標值介於70~50時，行情為處盤整狀態。
若BR值超過300，表行情處相對高價，應小心回檔。
若BR值低於50，表行情處於相對低價，應注意價位的反彈。
Length: 計算期數
}
input: Length(numeric);
variable: sum(0), brt(0);

sum= Summation((Close[1] - Low), length);
if sum <> 0 then
	brt = 100 * Summation((High - Close[1]), length) / sum
else
	brt = brt[1];

BR  = brt;

		