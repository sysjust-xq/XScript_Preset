{@type:sensor|@guid:aa9a1852fe3a4691b4df35b591b8addc|@path:/酒田戰法/長腳十字星|@hash:34911a50d5877815c2fd36237ef00fd7}
{																						
[檔名:]	長腳十字星			[資料夾:]	酒田戰法	[適用方向]	空															
[說明:]	大波動十字線																					
}																												
settotalbar(5);	
{判斷狀況}								
	condition1=	close>=open and open>=close					;//狀況1:	開收同價
	condition2=	(high-low)> close *0.015					;//狀況2:	波動大於1.5%
{結果判斷}		
IF		
		condition1
	and	condition2
THEN	RET=1;	