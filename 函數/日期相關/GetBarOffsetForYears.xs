{@type:function|@guid:4336228a3cfd46d28cebfe859686f34f|@path:/日期相關/GetBarOffsetForYears}
{
	計算BarOffset for N years
	
	return 0 if out-of-range
}

input: years(numericsimple, "N年");

value1 = DateAdd(Date, "Y", -1 * years);
retval = GetBarOffset(value1);