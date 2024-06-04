{@type:function|@guid:ac756bc9485545aea9974dcf2c061df4|@path:/價格取得/LowM|@hash:594cf0ad180f307736dbe261664a64fa}
SetBarMode(1);

input: PeriodsAgo(numericsimple);

LowM = GetField("Low","M")[PeriodsAgo];
