{@type:sensor|@guid:1ac1a9d16b2242ad97d15c777498da95|@path:/3.出場常用警示/高檔出現吊人線|@hash:1840d48392fc0a37ce2b7dc1b41798e8}
settotalbar(33);

if Close < Close[1] then begin
	  
	condition1 = 
		open = High and close < open and
	   (high -low) > 2 *(high[1]-low[1]) and 
	   (close-low) > (open-close) *2;
	  
	condition2= close[1] > highest(High,30)*0.98; //昨日收盤價接近三十日高點

	if condition1 and condition2 then ret=1;

end;