{@type:sensor}
input:Length(10); setinputname(1,"近N週期數");
input:TXT("僅適用日線"); setinputname(2,"使用限制");

settotalbar((Length + 3)*5);

if barfreq <> "D" and barfreq <> "AD" then Return;

if close < lowest(getfield("low","W")[1],Length)//近n週最低價
then ret=1;