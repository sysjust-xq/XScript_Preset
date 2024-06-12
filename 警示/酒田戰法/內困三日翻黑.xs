{@type:sensor}
{																						
[檔名:]	內困三日翻黑			[資料夾:]	酒田戰法	[適用方向]	空															
[說明:]	前兩期為長紅棒後包黑K棒 當期往下跌破紅棒開盤價																																								
}	
settotalbar(5);																											
{判斷狀況}								
	condition1=	close[2] > open[2] + high[3]-low[3]					;//狀況1:	前前期長紅棒
	condition2=	high[2] < high[3] and low[2] > low[3]					;//狀況2:	前期內包黑K棒
	condition3=	open >= close[1] and close < open[2]					;//狀況3:	開平高跌破三日低點
{結果判斷}		
IF		
		condition1
	and	condition2
	and	condition3
THEN	RET=1;	