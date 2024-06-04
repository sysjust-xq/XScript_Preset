{@type:sensor|@guid:3efb63aaf128408ba043c41b5a5423ab|@path:/技術分析/波動放大|@hash:bdb9273f90febf2d6d94972b4b7c53bb}
// 波動放大
//
input: Length(20), Percent(7);

settotalbar(3);
setbarback(Length);

SetInputName(1, "期數");
SetInputName(2, "波動幅度%");

Ret = Highest(High, Length) / Lowest(Low, Length) -1 > Percent*0.01;



        