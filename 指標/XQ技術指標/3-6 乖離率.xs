{@type:indicator|@guid:57fee1099c21434eb653fcd209a7619b|@path:/XQ技術指標/3-6 乖離率|@hash:4ed48d0b6548a0d500b45f3ea19dae12}
// XQ 3-6 乖離率
//
input: Length1(3), Length2(6);

SetInputName(1, "天數一");
SetInputName(2, "天數二");

Plot1(Bias(Length1) - Bias(Length2), "3-6乖離率(%)");

		