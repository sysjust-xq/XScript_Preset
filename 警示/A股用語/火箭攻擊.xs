{@type:sensor}
settotalbar(3);
IF CLOSE >=  CLOSE[1] * 1.015 and close=high and volume>volume[1]
then ret=1;