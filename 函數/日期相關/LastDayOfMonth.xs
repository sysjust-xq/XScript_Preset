{@type:function}
SetBarMode(1);

input: SelectedMonth(numericsimple);

value1 = dateadd(EncodeDate(year(date),SelectedMonth,1),"M",1);
value2 = dateadd(value1,"D",-DayOfMonth(value1));
retval = DayOfMonth(value2);