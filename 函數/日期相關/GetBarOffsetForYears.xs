{@type:function}
{
	計算BarOffset for N years
	
	return 0 if out-of-range
}

input: years(numericsimple, "N年");

value1 = DateAdd(Date, "Y", -1 * years);
retval = GetBarOffset(value1);