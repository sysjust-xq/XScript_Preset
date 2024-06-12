{@type:autotrade}
{
	範例

	當發生做多情境時, 把部位變成做多1口(如果此時是空手的話, 買進1口, 如果此時是做空1口的話, 回補這一口,同時買進1口)
	當發生做空情境時, 把部位變成做空1口(如果此時是空手的話, 賣出1口, 如果此時是做多1口的話, 賣出這一口,同時做空1口)
	
	做多後發生出場情境時, 多單出場(變成空手)
	做空後發生出場情境時, 空單出場(變成空手)

	這個是範例#1跟範例#2的綜合體, 可是包含了部位翻轉的邏輯(Position可能從-1變成1, 或是從1變成-1)
}

var: 
	long_condition(false), 			{ 是否做多 }
	exit_long_condition(false), 	{ 是否多單出場 }
	short_condition(false), 		{ 是否做空 }
	exit_short_condition(false);	{ 是否空單出場 }

if Position <> 1 and long_condition then begin
	{ 如果符合做多情境(long_condition), 則把部位變成1 (可能是0->1 or -1->1) }
	SetPosition(1);

end else if Position <> -1 and short_condition then begin
	{ 如果符合做空情境(short_condition), 則把部位變成-1 (可能是0->-1 or 1->-1) }
	SetPosition(-1);

end else if Position = 1 and exit_long_condition then begin
	{ 如果已經做多, 且發生多方出場情形時(exit_long_condition), 則把部位變成0 }
	SetPosition(0);

end else if Position = -1 and exit_short_condition then begin
	{ 如果已經做空, 且發生空方出場情形時(exit_short_condition), 則把部位變成0 }
	SetPosition(0);
end;

