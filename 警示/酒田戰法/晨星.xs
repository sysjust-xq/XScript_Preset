{@type:sensor}
{																						
[檔名:]	晨星			[資料夾:]	酒田戰法	[適用方向]	多															
[說明:]	前前期收長黑K棒 前期再開低震盪收短紅棒後  當期開高紅棒反攻起跌點 																																									
}																														
settotalbar(5);	
{判斷狀況}								
	condition1=	( open[2] - close[2] ) >(high[2] -low[2]) * 0.75					;//狀況1:	前前期出黑K棒
	condition2=	close[2] < close[3]-(high[3]-low[3])					;//狀況2:	跌勢擴大
	condition3=	( close - open ) >(high -low) * 0.75					;//狀況3:	當期收紅K棒
	condition4=	close> close[2]					;//狀況4:	收復黑棒收盤價
	condition5=	close[1] <= close[2] and close[1] < open					;//狀況5:	前低收盤為三期低點
{結果判斷}		
IF		
		condition1
	and	condition2
	and	condition3
	and	condition4
	and	condition5
THEN	RET=1;	