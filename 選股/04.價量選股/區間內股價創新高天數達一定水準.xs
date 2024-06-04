{@type:filter|@guid:1ab7eaff97cb499e9303c77fea4501e8|@path:/04.價量選股/區間內股價創新高天數達一定水準}
input:period(10,"計算區間");
input:lowlimit(3,"附合條件的最低次數");
if countif(high=highest(high,20),period)>=lowlimit
then ret=1;