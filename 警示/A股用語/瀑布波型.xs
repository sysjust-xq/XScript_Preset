{@type:sensor}
settotalbar(3);
setbarback(30);
if close[1] > lowest(close,30) * 1.2 and 
   (high-low)> close * 0.035 and 
   (close-low)> close * 0.01 
then ret=1;