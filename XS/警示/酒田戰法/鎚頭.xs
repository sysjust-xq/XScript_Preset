{@type:sensor|@guid:25ae974b6ff24faa853f4e7c8aba353c|@path:/酒田戰法/鎚頭|@hash:e5f8c8ffc9bcb3d32f7009dcb01ddf1c}
{									
[檔名:]	鎚頭			[資料夾:]	酒田戰法	[適用方向]	多		
[說明:]	開盤後下跌試底,盤中拉升上攻後,收在高點留下下影線								
}																
settotalbar(5);	
{判斷狀況}								
	condition1=	close >=high	and 	close > open			;//狀況1:	收高
	condition2=	(high -low) > 2 *(high[1]-low[1])					;//狀況2:	波動放大
	condition3=	(open-low) > (close - open)  *2 					;//狀況3:	長下影線
{結果判斷}									
IF									
		condition1							
	and	condition2							
	and	condition3													
THEN	RET=1;								