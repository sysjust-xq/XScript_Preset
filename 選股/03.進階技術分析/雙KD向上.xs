{@type:filter}
setbarfreq("AD");

input: Length_D(9, "日KD期間");
input: Length_W(5, "周KD期間");

variable:rsv_d(0),kk_d(0),dd_d(0);
variable:rsv_w(0),kk_w(0),dd_w(0);

stochastic(Length_D, 3, 3, rsv_d, kk_d, dd_d);
xf_stochastic("W", Length_W, 3, 3, rsv_w, kk_w, dd_w);

condition1 = kk_d crosses above dd_d;		// 日KD crosses over
condition2 = xf_crossover("W", kk_w, dd_w);	// 周KD crosses over
condition3 = average(volume[1], 5) >= 1000;

condition4 = kk_d[1] <= 30;							// 日K 低檔
condition5 = xf_getvalue("W", kk_w, 1) <= 50;		// 周K 低檔

ret = condition1 and condition2 and condition3 and condition4 and condition5;

outputfield(1,kk_d,2,"日K值");
outputfield(2,kk_w,2,"週K值", order := -1);
