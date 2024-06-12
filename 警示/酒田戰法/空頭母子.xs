{@type:sensor}
{																						
[檔名:]	空頭母子			[資料夾:]	酒田戰法	[適用方向]	空															
[說明:]	長紅棒後 內包短黑K																																									
}																													
settotalbar(5);	
{判斷狀況}								
	condition1=	( close[1] - open[1] ) > (high[1] -low[1]) * 0.8					;//狀況1:	前期實體紅棒
	condition2=	close[1]> close[2] + high[2]-low[2]					;//狀況2:	前期波動向上放大
	condition3=	( open - close )>(high -low) * 0.5					;//狀況3:	當期黑K棒
	condition4=	high[1] > high and low[1] < Low 					;//狀況4:	高不過高 低不過低 內包K棒
{結果判斷}		
IF		
		condition1
	and	condition2
	and	condition3
	and	condition4
THEN	RET=1;	