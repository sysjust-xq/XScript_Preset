{@type:sensor}
// 波動縮小
//
input: Length(20), Percent(7);

settotalbar(3);
setbarback(Length);

SetInputName(1, "期數");
SetInputName(2, "波動幅度%");

Ret = Highest(High, Length) / Lowest(Low, Length) -1 < Percent*0.01;



