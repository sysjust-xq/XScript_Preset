{@type:autotrade}
{
	範例: 
	
	當發生做多情境時, 買進1口
	做多後發生出場情境時, 多單出場(變成空手)
}

var: 
	long_condition(false), 		{ 是否做多 }
	exit_long_condition(false); { 是否多單出場 }

{ 
	Position=0時判斷是否要做多, 
	Position=1時判斷是否要出場 
}
if Position = 0 and long_condition then SetPosition(1);
if Position = 1 and exit_long_condition then SetPosition(0);


