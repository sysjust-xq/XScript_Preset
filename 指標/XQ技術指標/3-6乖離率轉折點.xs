{@type:indicator|@guid:2f2492db3d7c417092e7fa137ef49843|@path:/XQ技術指標/3-6乖離率轉折點|@hash:c2ae6c7ccdf6183c25b222ac26a75162}
// XQ: 3-6乖離率轉折點
//
Value1 = 2 * Close[3] - Close[6];
Plot1(Value1, "T");
		