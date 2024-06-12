{@type:function}
{
	把某個數值序列的MA轉成Array
	
	範例:
	
	Array: MAArray[](0);
	
	ArrayMASeries(Close, 10, MAArray);
	
    // Array_GetMaxIndex(MAArray) = 10	
	// MAArray[1] = MA(Close, 10), 
	// MAArray[2] = MA(Close[1], 10),
	// MAArray[3] = MA(Close[2], 10),
	// ...
}

input: TheSeries(numericseries, "序列");
input: MALength(numericsimple, "MA天期");
Input: TargetArray[X](NumericArrayRef);

Array_SetMaxIndex(TargetArray, MALength);

var: acc(0), idx(0);
acc = 0;

for idx = 0 to MALength-1 begin
	acc = acc + TheSeries[idx];
end;

for idx = 0 to MALength-1 begin
	TargetArray[idx+1] = acc / MALength;
	acc = acc - TheSeries[idx];
	acc = acc + TheSeries[MALength + idx];
end;	
