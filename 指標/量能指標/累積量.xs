{@type:indicator|@guid:f48bfd480373464daf4de8fcc51cd8e9|@path:/量能指標/累積量|@hash:26aa1adc5a07a35d48193ed5276bc273}
variable:tv(0);//當日累積量

if date<>date[1] then
	tv=volume
else
	tv=tv[1]+volume;

plot1(tv,"累積量");