{@type:sensor|@guid:f1434d1c69aa4e65a2b218d28f70c529|@path:/3.出場常用警示/一黑破n紅|@hash:bd4d57891391636a2f02b190556724fd}
input:Length(3); setinputname(1,"計算期數");

settotalbar(Length + 3);

if high=highest(high[1],Length) and close<lowest(low[1],Length) 
then ret=1;