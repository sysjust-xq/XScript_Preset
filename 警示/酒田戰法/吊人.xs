{@type:sensor|@guid:5b73a9a1bf2f45a89ed4b0eb3deb6fd5|@path:/酒田戰法/吊人|@hash:81c1ed42577966d2803ad9bf2d143aff}
{																						
[檔名:]	吊人			[資料夾:]	酒田戰法	[適用方向]	空															
[說明:]	短黑棒留長下影線																																								
}																						
settotalbar(5);						
{判斷狀況}								
	condition1=	open = High and close < open					;//狀況1:	開高收低留黑棒
	condition2=	(high -low) > 2 *(high[1]-low[1])					;//狀況2:	波動倍增
	condition3=	(close-low)> (open-close)  *2					;//狀況3:	下影線為實體兩倍以上
{結果判斷}		
IF		
		condition1
	and	condition2
	and	condition3
THEN	RET=1;	