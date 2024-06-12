{@type:sensor}
//ETF 作多  40天後出場

input:length(14);
variable:wvad(0);
value1=close-open;
value2=high-low;
if high<>low
then value3=value1/value2*volume
else
value3=value3[1];
wvad=summation(value3,length);
if wvad<0
and linearregslope(wvad,5)>0
and linearregslope(wvad,15)<0
and linearregslope(close,20)<0
and GetSymbolField("tse.tw","收盤價","W")
>average(GetSymbolField("tse.tw","收盤價","W"),13)
then ret=1;