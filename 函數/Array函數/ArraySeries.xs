{@type:function}
{
	把某個數值序列轉成Array
	

	範例:
	
	Array: CloseArray[](0);
	
	ArraySeries(Close, 10, CloseArray);
	
    // Array_GetMaxIndex(CloseArray) = 10	
	// CloseArray[1] = Close, CloseArray[2] = Close[1], CloseArray[3] = Close[2], ..
}

input: TheSeries(numericseries, "序列");
input: Length(numericsimple, "序列長度");
Input: TargetArray[X](NumericArrayRef);

Array_SetMaxIndex(TargetArray, Length);

Var: idx(0);
for idx = 0 to Length - 1 begin
	TargetArray[idx+1] = TheSeries[idx];
end;	