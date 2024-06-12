{@type:sensor}
{									
[檔名:]	帶量鎚頭			[資料夾:]	酒田戰法	[適用方向]	多		
[說明:]	開盤後下跌試底,盤中拉升上攻後,收在高點留下下影線 衝出倍增量														
}													
settotalbar(5);	
{判斷狀況}								
	condition1=	close >=high	and 	close > open			;//狀況1:	收高
	condition2=	(high -low) > 2 *(high[1]-low[1])					;//狀況2:	波動放大
	condition3=	(open-low) > (close - open)  *2 					;//狀況3:	長下影線
	condition4=	Volume > Volume[1]*2					;//狀況4:	當期量倍增	
{結果判斷}									
IF									
		condition1							
	and	condition2							
	and	condition3							
	and	condition4														
THEN	RET=1;								