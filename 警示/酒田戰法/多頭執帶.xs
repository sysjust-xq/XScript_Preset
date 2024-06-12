{@type:sensor}
{								
[檔名:]	多頭執帶			[資料夾:]	酒田戰法	[適用方向]	多	
[說明:]	開在最低點一路走高收在最高點附近的K棒												
}
settotalbar(5);																
{判斷狀況}								
	condition1=	close>open					;//狀況1:	
	condition2=	(Close-Open)>(high-low)*0.9					;//狀況2:	
	condition3=	Close>Close[1]+high[1]-low[1]					;//狀況3:	
{結果判斷}		
IF		
		condition1
	and	condition2
	and	condition3
THEN	RET=1;	