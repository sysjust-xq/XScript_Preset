{@type:sensor|@guid:3920a4e1c2ef4e2b81572038d664f305|@path:/酒田戰法/蜻蜓十字|@hash:bf22e0c0ecb59c8d1d80823446334020}
{																						
[檔名:]	蜻蜓十字			[資料夾:]	酒田戰法	[適用方向]	空															
[說明:]	T形線																					
}																						
settotalbar(5);							
{判斷狀況}								
	condition1=	close>=open and open>=high					;//狀況1:	開收高同價
	condition2=	(high-low)> close *0.01					;//狀況2:	波動大於1%
{結果判斷}		
IF		
		condition1
	and	condition2
THEN	RET=1;	