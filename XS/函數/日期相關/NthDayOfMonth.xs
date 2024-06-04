{@type:function|@guid:2661174c578842599ba79c24c1c33cd6|@path:/日期相關/NthDayOfMonth|@hash:60360182a4fed373cc1fc8ef8b0a9db0}
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
