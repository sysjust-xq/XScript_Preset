{@type:sensor}
{																						
[檔名:]	空頭遭遇			[資料夾:]	酒田戰法	[適用方向]	空															
[說明:]	紅棒後 開高走低守平盤																					
}																													
settotalbar(5);	
{判斷狀況}								
	condition1=	( close[1] - open[1] ) > (high[1] -low[1]) * 0.5					;//狀況1:	前期實體紅棒
	condition2=	( open - close ) > (high -low) * 0.5					;//狀況2:	當期實體黑棒
	condition3=	open > high[1] and close > close[1]					;//狀況3:	開過昨高收守平盤	
{結果判斷}		
IF		
		condition1
	and	condition2
	and	condition3
THEN	RET=1;	