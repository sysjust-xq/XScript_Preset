{@type:sensor|@guid:1a33d000ab9e4e24b943da39698b9d97|@path:/3.出場常用警示/資增券減還收黑|@hash:c37f1d224e271e4fba1648c45bf13ded}
input:V1(1000); setinputname(1,"融資增加張數");
input:V2(500); setinputname(2,"融券減少張數");
input:TXT("僅適用日線"); setinputname(3,"使用限制");

settotalbar(3);

if BarFreq <> "D" then return;

if close < close[1] and 
   GetField("融資增減張數")[1] > V1 and
   GetField("融券增減張數")[1] < V2*-1
then ret=1;
   
