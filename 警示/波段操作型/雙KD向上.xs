{@type:sensor}
input: Length_D(9, "日KD期間");
input: Length_W(5, "周KD期間");

variable:rsv_d(0),kk_d(0),dd_d(0);
variable:rsv_w(0),kk_w(0),dd_w(0);

stochastic(Length_D, 3, 3, rsv_d, kk_d, dd_d);
xf_stochastic("W", Length_W, 3, 3, rsv_w, kk_w, dd_w);

//透過Z的時間安排來決定現在用的是那一根Bar的資料 
variable: Z(0);
if currenttime > 180000 
or currenttime < 083000 then 
	Z =0 
else 
	Z=1;
	
condition1 = kk_d crosses above dd_d;		// 日KD crosses over
condition2 = xf_GetBoolean("W",xf_crossover("W", kk_w, dd_w),1);	// 周KD crosses over
condition3 = average(volume[1], 5) >= 1000;
condition4 = kk_d[1] <= 30;							// 日K 低檔
condition5 = xf_getvalue("W", kk_w, 1) <= 50;		// 周K 低檔

// 成交量判斷
Condition6 = Average(Volume[1], 100) >= 1000;

Condition7 = tselsindex(10,6)=1;

if condition1 
and condition2 
and condition3 
and condition4 
and condition5 
and condition6
and Condition7[Z]
then ret=1;
