{@type:sensor}
{																						
[檔名:]	多頭吞噬			[資料夾:]	酒田戰法	[適用方向]	多															
[說明:]	前期收短黑K棒 當期開低走高拉出長紅棒 波動率放大 穿過昨高																																									
}																						
settotalbar(5);							
{判斷狀況}								
	condition1=	( open[1] - close[1] ) >(high[1] -low[1])*0.75					;//狀況1:	前期出黑K棒
	condition2=	( close - open ) >(high -low) * 0.75					;//狀況2:	當期紅棒
	condition3=	high > high[1]					;//狀況3:	高過昨高
	condition4=	open<low[1]					;//狀況4:	開低破昨低
	condition5=	Volume > Volume[1]*2					;//狀況5:	
{結果判斷}		
IF		
		condition1
	and	condition2
	and	condition3
	and	condition4
	and	condition5
THEN	RET=1;	