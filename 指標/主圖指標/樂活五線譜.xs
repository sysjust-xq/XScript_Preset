{@type:indicator}
input:period(720,"計算期間");
array: line_diff[](0);
var: diff_avg(0), _sum(0);

Array_SetMaxIndex(line_diff, period);
linearreg(close,period,0,value2,value3,value4,value5);

{計算(收盤-迴歸)標準差}
//先計算區間內的 收盤 - 迴歸 值
_sum = 0;
for value1 = 1 to period begin
    line_diff[value1] = close[period - value1] - (value2 * value1 + value4);
	_sum += close[period - value1] - (value2 * value1 + value4);
	end;
// 收盤-迴歸的平均	
diff_avg = _sum / period;

//計算標準差
_sum = 0;
for value1 = 1 to period begin
    _sum += power((line_diff[value1] - diff_avg), 2);
	end;
value6 = squareroot(_sum / period);

value7=value5+value6;
value8=value5+2*value6;
value9=value5-value6;
value10=value5-2*value6;
plot1(value8,"+2SD");
plot2(value7,"+1SD");
plot3(value5,"TL");
plot4(value9,"-1SD");
plot5(value10,"-2SD");