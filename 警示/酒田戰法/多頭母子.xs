{@type:sensor}
{																						
[檔名:]	多頭母子			[資料夾:]	酒田戰法	[適用方向]	多															
[說明:]	前期收長黑K棒 今期開高小幅收紅不過昨高																					
}																						
settotalbar(5);	
{判斷狀況}								
	condition1=	( open[1] - close[1] ) >(high[1] -low[1])*0.75					;//狀況1:	前期出長黑K棒
	condition2=	close[1] < close[2] - high[2]-low[2]					;//狀況2:	前期呈波動放大下跌
	condition3=	( close - open ) >(high -low) * 0.75					;//狀況3:	當期紅棒
	condition4=	high < high[1]					;//狀況4:	高不過昨高
	condition5=	low>low[1]					;//狀況5:	低不破昨低
{結果判斷}		
IF		
		condition1
	and	condition2
	and	condition3
	and	condition4
	and	condition5
THEN	RET=1;	