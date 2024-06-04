{@type:function|@guid:5f76de57dba441808c8c784d8fa54994|@path:/技術指標/BollingerBand|@hash:49e07edb5c86cc896357f9566e4b2fec}
SetBarMode(1);

// BollingerBand function
//
Input: price(numericseries), length(numericsimple), _band(numericsimple);

BollingerBand = Average(price, length) + _band * StandardDev(price, length, 1);
        