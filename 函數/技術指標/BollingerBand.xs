{@type:function}
SetBarMode(1);

// BollingerBand function
//
Input: price(numericseries), length(numericsimple), _band(numericsimple);

BollingerBand = Average(price, length) + _band * StandardDev(price, length, 1);
        