{@type:function|@guid:afeb8314c6e04e23a59c10b1c152bb0d|@path:/邏輯判斷/CountIfARow}
SetBarMode(1);

input:TrueAndFalse(truefalseseries),Length(numericsimple);

CountIfARow = truecount(TrueAndFalse,Length);
