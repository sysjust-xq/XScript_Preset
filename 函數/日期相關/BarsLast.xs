{@type:function}
SetBarMode(2);

input:  pX(TrueFalseSeries);

if pX then value1 = currentbar;

BarsLast = currentbar - value1;
