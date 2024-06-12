{@type:indicator}
// 跨頻率週KD指標
// 不支援大頻率跨小頻率，例如：
// 不支援主頻率週資料，跨頻率計算日KD技術指標。
//
if barfreq <> "Tick" and barfreq <> "Min" and barfreq <> "D" and barfreq <> "W" and barfreq <> "AD" and barfreq <> "AW" then raiseruntimeerror("不支援大頻率跨小頻率");

input: Length(5), RSVt(3), Kt(3);
variable: rsv(0), k(0), _d(0);

SetInputName(1, "天數");
SetInputName(2, "RSVt權數");
SetInputName(3, "Kt權數");

xf_stochastic("W", Length, RSVt, Kt, rsv, k, _d);

Plot1(k, "週K(%)");
Plot2(_d, "週D(%)");
