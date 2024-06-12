{@type:autotrade}
{
	範例: 透過Filled來判斷是否要加碼
	
	當發生做多情境時, 買進1口
	買進成交後, 如果發生加碼情境時, 再買進1口,
	如果發生出場情境時, 多單出場(變成空手, 部位=0)
}

var: 
	long_condition(false), 			{ 是否做多 }
	raise_long_condition(false),	{ 是否多單加碼 }
	exit_long_condition(false); 	{ 是否多單出場 }


if Position = 0 and long_condition then begin
	{ 目前Position=0, 而且發生做多情境, 買進1口 }
	SetPosition(1);
	
end else if Position <> 0 and exit_long_condition then begin
	{ 已經買進, 而且發生多單出場情境, 賣出所有部位 }
	{ 請注意, Position可能是1 or 2, 所以用 <> 0 來判斷 }
	SetPosition(0);
	
end else if Position = 1 and Filled = 1 and raise_long_condition then begin
	{ 已經買進1口, 而且也成交了, 此時發生加碼情境, 所以再買進1口}
	
	SetPosition(2);
	
	{ 也可以寫成 SetPosition(position + 1) }
end;
	
