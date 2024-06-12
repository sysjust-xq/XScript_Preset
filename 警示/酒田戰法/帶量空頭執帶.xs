{@type:sensor}
{																						
[檔名:]	帶量空頭執帶			[資料夾:]	酒田戰法	[適用方向]	空															
[說明:]	量倍增長黑棒																																									
}
settotalbar(5);																														
{判斷狀況}								
	condition1=	( open - close ) > (high -low) * 0.8					;//狀況1:	實體黑K棒
	condition2=	close < close[1] - (high[1]-low[1])					;//狀況2:	波動向下放大
	condition3=	Volume > Volume[1]*2					;//狀況3:		
{結果判斷}		
IF		
		condition1
	and	condition2
	and	condition3
THEN	RET=1;	