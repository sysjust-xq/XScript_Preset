{@type:function|@guid:80fa4d5b31cc46ff93f8c9a1551b0529|@path:/日期相關/BarsLast|@hash:c9a7b5465b64430c766cc8b803e62960}
SetBarMode(2);

input:  pX(TrueFalseSeries);

if pX then value1 = currentbar;

BarsLast = currentbar - value1;
