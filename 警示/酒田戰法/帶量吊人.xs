{@type:sensor}
{																						
[檔名:]	帶量吊人			[資料夾:]	酒田戰法	[適用方向]	空															
[說明:]	短黑棒留長下影線 量倍增																					
}																						
settotalbar(5);							
{判斷狀況}								
	condition1=	open = High and close < open					;//狀況1:	開高收低留黑棒
	condition2=	(high -low) > 2 *(high[1]-low[1])					;//狀況2:	波動倍增
	condition3=	(close-low)> (open-close)  *2					;//狀況3:	下影線為實體兩倍以上
	condition4=	Volume > Volume[1]					;//狀況4:		
{結果判斷}		
IF		
		condition1
	and	condition2
	and	condition3
	and	condition4
THEN	RET=1;	