{@type:autotrade}
{
	範例: 
	
	當發生做空情境時, 賣出1口(做空)
	做空後發生出場情境時, 空單出場(變成空手)
}

var: 
	short_condition(false), 		{ 是否做空 }
	exit_short_condition(false);	{ 是否空單出場 }

{ 
	Position=0時判斷是否要做空, 
	Position=-1時判斷是否要回補 
}
if Position = 0 and short_condition then SetPosition(-1);
if Position = -1 and exit_short_condition then SetPosition(0);


