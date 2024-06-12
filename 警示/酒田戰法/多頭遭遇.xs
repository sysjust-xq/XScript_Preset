{@type:sensor}
{																						
[檔名:]	多頭遭遇			[資料夾:]	酒田戰法	[適用方向]	多															
[說明:]	前期收黑K棒 當期開低走高紅棒嘗試反攻昨收 																																								
}
settotalbar(5);																														
{判斷狀況}								
	condition1=	 (open[1] - close[1] ) >(high[1] -low[1]) * 0.75					;//狀況1:	前期出黑K棒
	condition2=	close[1] < close[2]					;//狀況2:	前期收跌
	condition3=	( close - open ) >(high -low) * 0.75					;//狀況3:	當期收紅K棒
	condition4=	open  < close[1] and close < close[1]					;//狀況4:	開低且收跌
	condition5=	low <  low[1]					;//狀況5:	破前期低點
{結果判斷}		
IF		
		condition1
	and	condition2
	and	condition3
	and	condition4
	and	condition5
THEN	RET=1;	