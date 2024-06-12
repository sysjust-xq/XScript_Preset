{@type:sensor}
{																						
[檔名:]	夜星			[資料夾:]	酒田戰法	[適用方向]	空															
[說明:]	紅棒後 開高走低守平盤																																									
}
settotalbar(5);																														
{判斷狀況}								
	condition1=	 ( close[2] - open[2] ) > (high[2] -low[2]) * 0.75					;//狀況1:	前前期實體紅棒
	condition2=	close[2] > close[3] + (high[3]-low[3])					;//狀況2:	前前期波動放大
	condition3=	low[1] > high[2] and close[1]>open[1]					;//狀況3:	前期高開收紅
	condition4=	open < close[1] and close < open - (high[1]-low[1])					;//狀況4:	當期開低收黑K棒
{結果判斷}		
IF		
		condition1
	and	condition2
	and	condition3
	and	condition4
THEN	RET=1;	