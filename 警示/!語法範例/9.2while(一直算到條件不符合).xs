{@type:sensor}
//還有另一種迴圈是while，會一直執行到條件不符合
//請小心不要造成無法跳出的無窮迴圈

//==============================範例：開盤五分鐘創三次新高﹙改用while迴圈﹚======================

variable: n(0);
variable: count(0);
if  Barinterval=1 and barfreq ="Min" then Begin  //適用於1分鐘線
//執行迴圈，檢查過去五分鐘高點過前高的次數
if time = 90500 then begin
	n = 1;
	while n <= 5 begin//以下的陳述(到end;為止)，n=1執行一次，n=2執行一次，一直到n=5
		if high[n]>high[n-1]
		then count=count+1;
		n = n + 1;
	end;
end;

//設定警示條件：if.. then ret=1;
if count>=3
then ret=1;
end;
