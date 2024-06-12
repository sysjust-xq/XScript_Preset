{@type:filter}
input:period(10,"計算區間");
input:lowlimit(3,"附合條件的最低次數");
if countif(high=highest(high,20),period)>=lowlimit
then ret=1;