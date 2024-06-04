{@type:indicator|@guid:2f8e3802a94248339b621cfe99f7d66d|@path:/主圖指標/肯特納通道|@hash:c72ebb9330135aa5eaccfddf147d4180}
Input: Length(20); setinputname(1, "天期");
Input: UpperBand(2); SetInputName(2, "上通道寬度");
Input: LowerBand(2); SetInputName(3, "下通道寬度");

variable : hband(0),lband(0),midline(0); 

midline = XAverage(close, Length);
hband = midline + ATR(Length) * UpperBand;
lband = midline - ATR(Length) * LowerBand;

Plot1(hband, "UB");
Plot2(midline, "KeltnerMA");
Plot3(lband, "LB");

 