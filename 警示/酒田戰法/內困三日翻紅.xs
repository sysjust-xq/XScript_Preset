{@type:sensor}
{								
[檔名:]	內困三日翻紅			[資料夾:]	酒田戰法	[適用方向]	多	
[說明:]	黑K棒後內包前期短紅棒 當期再以紅棒突破黑棒開盤價												
}								
settotalbar(5);					
{判斷狀況}								
	condition1=	( open[2] - close[2] ) >(high[2] -low[2]) * 0.75					;//狀況1:	實體下跌K棒
	condition2=	( close[1] - open[1] ) >(high[1] -low[1]) * 0.75					;//狀況2:	實體上漲K棒
	condition3=	 high[1] < high[2] and low[1] > low[2]					;//狀況3:	前期內包於前前期
	condition4=	( close - open )  > 0.75 *(high -low)					;//狀況4:	當期實體上漲K棒
	condition5=	close > open[2]					;//狀況5:	現價突破前前期開盤價
{結果判斷}		
IF		
		condition1
	and	condition2
	and	condition3
	and	condition4
	and	condition5
THEN	RET=1;	