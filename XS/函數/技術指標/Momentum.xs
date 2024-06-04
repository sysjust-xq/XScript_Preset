{@type:function|@guid:239cb1c1f329431ea731982d8f5d94f2|@path:/技術指標/Momentum|@hash:a16393e65b34d64aa05f3f7d7b56939f}
SetBarMode(2);

// Momentum function
//
input: price(numericseries), length(numericsimple);

Momentum = price - price[length];


        