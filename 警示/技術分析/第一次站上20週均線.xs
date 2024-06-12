{@type:sensor}
if barfreq<>"W" then return;
if close crosses over average(close,20)
and barslast(close crosses over average(close,20))[1]
>20
then ret=1;