{@type:sensor}
if average(close,3) crosses above average(close,55)
and volume> average(volume,5)
and atr(3) > atr(20)
then ret=1;