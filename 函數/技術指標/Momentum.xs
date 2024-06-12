{@type:function}
SetBarMode(2);

// Momentum function
//
input: price(numericseries), length(numericsimple);

Momentum = price - price[length];


        