{@type:sensor}
{																						
[檔名:]	十字線			[資料夾:]	酒田戰法	[適用方向]	不指定															
[說明:]	K棒收十字線																																								
}																						
settotalbar(5);					
{判斷狀況}								
	condition1=	close =open					;//狀況1:	開盤價等於收盤價
	condition2=	high>open					;//狀況2:	有漲
	condition3=	low<open					;//狀況3:	有跌
{結果判斷}		
IF		
		condition1
	and	condition2
	and	condition3
THEN	RET=1;	