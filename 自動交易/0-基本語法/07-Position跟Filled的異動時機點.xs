{@type:autotrade}
{
	系統在什麼時候會更新Position以及Filled ?

	系統洗價(執行腳本)的邏輯如下:
	
	- 當成交價異動時(逐筆洗價)或是K棒完成時(非逐筆洗價)執行腳本,
	
	- 要執行腳本前, 先決定當時的Position以及Filled的數值,
	
	- 執行腳本的邏輯,
	
	- 如果執行時腳本呼叫SetPosition的話, 則紀錄"第一次"呼叫SetPosition的狀態,
	
	- 接下來腳本如果又呼叫其他的SetPosition的話, 則[不予理會], 也就是說洗價過程內如果腳本呼叫了
	  很多個SetPosition的話, 系統只會執行第一個,
	  
	- 在洗價過程內, Position跟Filled的數值都會維持不變, 就算洗價到一半時突然收到成交的話, Filled也不會更動(不然的話腳本的計算
      邏輯可能會因為Filled的異動而亂掉)	
	
	- 等到腳本洗價完畢, 依照委託/執行的狀態, 決定要如何送單,
	
	- 同時也會更新Position的數值(所以下一次洗價時Position的數值會異動)
	
	- 如果在下一次洗價前收到任何成交的話, 也會更新Filled的數值(所以下一次洗價時Filled的數值會是洗價前的成交狀態)	
}

{
	範例#1: 說明多個SetPosition時的執行邏輯, 以及Position何時異動
}

if currentbar = 1 then begin
	print(Position);			{ 印出 0 }
	SetPosition(1);				{ 這是第一次呼叫的SetPosition(), 系統會執行這一個 }
	print(Position);			{ 印出 0, 要等到下一次洗價時Position才會變成1 }
	SetPosition(2);				{ 這次呼叫會被忽略, 因為line#33已經呼叫了SetPosition() }
	print(Position);			{ 印出 0, 要等到下一次洗價時Position才會變成1 }
end else if currentbar = 2 then begin
	print(Position);			{ 印出 1, 因為currentbar=1的時候執行了line#33的SetPosition(1) }
	SetPosition(2);				{ 這是這一次洗價第一次呼叫的SetPosition(), 系統會執行這一個 }
	print(Position);			{ 印出 1, 要等到下一次洗價時Position才會變成2 }
end;

{
	範例#2: 因為每一次洗價只會執行一個SetPosition, 所以如果系統希望可以依照不同情境決定部位的數量, 那該怎麼設計 ? 
}

var: long_condition(false), strong_condition(false);

{ 
	如果long_condition成立時買1張, 
	如果strong_condition成立時就買2張
}

// 寫法#1 => 有問題!! 如果long_condition跟strong_condition都成立時, 只會買1張
//
if long_condition then SetPosition(1);
if strong_condition then SetPosition(2);

// 寫法#2 => OK, 因為會先判斷strong_condition(買比較多的先判斷, 設計時要小心先後順序)
//
if strong_condition then SetPosition(2);
if long_condition then SetPosition(1);

// 寫法#3 => OK(推薦) 依照不同情形計算預期部位, 最後再一次呼叫SetPosition
//
if long_condition then value1 = 1;
if strong_condition then value1 = 2;

if value1 <> 0 then SetPosition(value1);



	
	



	

