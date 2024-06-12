{@type:filter}
if volume[1]<2000
and volume>2000
and close=highest(close,20)
then ret=1;