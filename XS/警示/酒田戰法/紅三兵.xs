{@type:sensor|@guid:66f656fe04c84b27a9f1f21f128a6021|@path:/酒田戰法/紅三兵|@hash:287000d35f036ed3dd8aa61a5388e648}
{								
[檔名:]	紅三兵			[資料夾:]	酒田戰法	[適用方向]	多	
[說明:]	連續三根上漲實體K棒							
}															
settotalbar(5);	
{判斷狀況}								
	condition1=	( close - open ) >(high -low) * 0.75					;//狀況1:	實體上漲K棒
	condition2=	( close[1] - open[1] ) >(high[1] -low[1]) * 0.75					;//狀況2:	實體上漲K棒
	condition3=	( close[2] - open[2] ) >(high[2] -low[2]) * 0.75					;//狀況3:	實體上漲K棒
	condition4=	close > close[1]					;//狀況4:	上漲
	condition5=	close[1] > close[2]					;//狀況5:	上漲
{結果判斷}		
IF		
		condition1
	and	condition2
	and	condition3
	and	condition4
	and	condition5
THEN	RET=1;	