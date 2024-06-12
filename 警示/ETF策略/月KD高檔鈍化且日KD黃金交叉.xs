{@type:sensor}
input: Length_D(9, "日KD期間");
input: Length_M(5, "月KD期間");

variable:rsv_d(0),kk_d(0),dd_d(0);
variable:rsv_M(0),kk_M(0),dd_M(0);

stochastic(Length_D, 3, 3, rsv_d, kk_d, dd_d);
xf_stochastic("M", Length_M, 3, 3, rsv_m, kk_m, dd_m);

if xf_getvalue("M", kk_m, 1) >= 85 and kk_d crosses over dd_d then ret=1;


