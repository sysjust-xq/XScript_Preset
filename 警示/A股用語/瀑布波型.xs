{@type:sensor|@guid:69ad190a83f24ae1bd4696c1b6eab2ea|@path:/A股用語/瀑布波型|@hash:3687b6f0eba10c87096a2131f2b2682a}
settotalbar(3);
setbarback(30);
if close[1] > lowest(close,30) * 1.2 and 
   (high-low)> close * 0.035 and 
   (close-low)> close * 0.01 
then ret=1;