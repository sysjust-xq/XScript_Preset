{@type:sensor}
{																						
[檔名:]	多頭三星			[資料夾:]	酒田戰法	[適用方向]	多															
[說明:]	近三期開高低收皆呈Ｖ形排列																																								
}																						
settotalbar(5);							
{判斷狀況}								
	condition1=	open> open[1] and open[2]>open[1]					;//狀況1:	開盤價排列
	condition2=	high> high[1] and high[2]>high[1]					;//狀況2:	最高價排列
	condition3=	low> low[1] and low[2]>low[1]					;//狀況3:	最低價排列
	condition4=	close> close[1] and close[2]>close[1]					;//狀況4:	收盤價排列
{結果判斷}		
IF		
		condition1
	and	condition2
	and	condition3
	and	condition4
THEN	RET=1;	