{@type:function}
SetBarMode(1);

// 計算自某一天起算的第N個星期序數的日期
//
input: StartDate(numericsimple), Nth(numericsimple), TargetDay(numericsimple);

variable: OddDaysOfWeek(0);

OddDaysOfWeek = TargetDay - DayOfWeek(StartDate);

If OddDaysOfWeek > 0 Then
	NthDayofMonth = dateadd(startdate,"D", iff(Nth >= 0,(Nth - 1 ),Nth) * 7 + OddDaysOfWeek)
Else if OddDaysOfWeek < 0 Then
	NthDayofMonth = dateadd(startdate,"D", iff(Nth >= 0,Nth,(Nth + 1)) * 7 + OddDaysOfWeek)
Else
	NthDayofMonth = dateadd(startdate,"D", iff(Nth >= 0,Nth - 1, Nth + 1) * 7);
