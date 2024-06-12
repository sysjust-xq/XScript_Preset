{@type:sensor}
{								
[檔名:]	倒狀鎚子			[資料夾:]	酒田戰法	[適用方向]	多	
[說明:]	前期收長黑K棒 今期開低試圖上攻後收上影線短紅棒												
}								
settotalbar(5);
{判斷狀況}								
	condition1=	( open[1] - close[1] ) >(high[1] -low[1]) * 0.75					;//狀況1:	前期出長黑K棒
	condition2=	 close[1] < close[2] - (high[2]-low[2])					;//狀況2:	前期呈波動放大下跌
	condition3=	close > open and (high -close)> (close-open) *2					;//狀況3:	收紅上影線
{結果判斷}		
IF		
		condition1
	and	condition2
	and	condition3
THEN	RET=1;	