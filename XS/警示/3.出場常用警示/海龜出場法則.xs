{@type:sensor|@guid:94c34257fa1d4a08ba06e39d4ce95d2b|@path:/3.出場常用警示/海龜出場法則|@hash:743b6d871d34a127e180643b92e6d503}
input:Length(10); setinputname(1,"近N週期數");
input:TXT("僅適用日線"); setinputname(2,"使用限制");

settotalbar((Length + 3)*5);

if barfreq <> "D" and barfreq <> "AD" then Return;

if close < lowest(getfield("low","W")[1],Length)//近n週最低價
then ret=1;