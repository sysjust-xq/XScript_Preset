{@type:function}
SetBarMode(2);

{
輸出ADI指標值:
當日價格是漲時，表示上升力道戰勝，將此力道累積起來。
若當日是下跌，便從上升累積力道中減去下降的力道。
}
variable: ADIt(0);

if Close > Close[1] then
	ADIt = ADIt[1] + (Close - minlist(low, close[1]))
else
  begin
	if Close < Close[1] then
		ADIt = ADIt[1] - (maxlist(high, close[1]) - close)
	else
		ADIt = ADIt[1];
  end;

ADI =ADIt;

		