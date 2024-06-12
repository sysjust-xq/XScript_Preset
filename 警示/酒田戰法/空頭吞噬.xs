{@type:sensor}
{																						
[檔名:]	空頭吞噬			[資料夾:]	酒田戰法	[適用方向]	空															
[說明:]	紅棒後 開高下跌破昨低收長黑K棒																																									
}																						
settotalbar(5);								
{判斷狀況}								
	condition1=	( close[1] - open[1] ) > (high[1] -low[1]) * 0.5					;//狀況1:	前期實體紅棒
	condition2=	 high-low >( high[1]-low[1])*2					;//狀況2:	當期波動倍曾
	condition3=	( open - close )>(high -low) * 0.75					;//狀況3:	當期黑K棒
	condition4=	open > close[1] and close < low[1]					;//狀況4:	開高下跌破昨低
{結果判斷}		
IF		
		condition1
	and	condition2
	and	condition3
	and	condition4
THEN	RET=1;	