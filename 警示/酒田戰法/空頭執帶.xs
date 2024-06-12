{@type:sensor}
{																						
[檔名:]	空頭執帶			[資料夾:]	酒田戰法	[適用方向]	空															
[說明:]	長黑棒																																									
}																						
settotalbar(5);	
{判斷狀況}								
	condition1=	( open - close ) > (high -low) * 0.8					;//狀況1:	實體黑K棒
	condition2=	close < close[1] - (high[1]-low[1])					;//狀況2:	波動向下放大
{結果判斷}		
IF		
		condition1
	and	condition2
THEN	RET=1;	