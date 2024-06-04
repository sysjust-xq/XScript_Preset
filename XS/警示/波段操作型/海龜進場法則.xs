{@type:sensor|@guid:1cefbdd9c87f48e78a3ac4c195fadc81|@path:/波段操作型/海龜進場法則|@hash:08deff523aadf77861138bdc0cf9537a}
input:Length(10); setinputname(1,"近N週期數");
input:TXT("僅適用日線"); setinputname(2,"使用限制");

settotalbar((Length + 3)*5);

if barfreq <> "D" and barfreq <> "AD" then Return;

if close > highest(getfield("High","W")[1],Length)//近n週最高價
then ret=1;