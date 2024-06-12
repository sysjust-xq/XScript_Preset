{@type:indicator}
variable:tv(0);//當日累積量

if date<>date[1] then
	tv=volume
else
	tv=tv[1]+volume;

plot1(tv,"累積量");