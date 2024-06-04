{@type:function|@guid:ef0119ecb49d4b7e9ce30027b8a3dfee|@path:/日期相關/LastDayOfMonth|@hash:6881415999f8f5be75b114c599f1a278}
SetBarMode(1);

input: SelectedMonth(numericsimple);

value1 = dateadd(EncodeDate(year(date),month(date),1),"M",1);
value2 = dateadd(value1,"D",-DayOfMonth(value1));
lastdayofmonth = DayOfMonth(value2);
