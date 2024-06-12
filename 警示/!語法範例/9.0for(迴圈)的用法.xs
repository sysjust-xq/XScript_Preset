{@type:sensor}
//迴圈是用來重複執行多次相同的敘述句

//==============================範例：開盤五分鐘創三次新高======================

variable: n(0);
variable: count(0);

if  Barinterval=1 and barfreq ="Min" then Begin  //適用於1分鐘線
//執行迴圈，檢查過去五分鐘高點過前高的次數
if time = 90500 then begin
	for n=1 to 5 begin//以下的陳述(到end;為止)，n=1執行一次，n=2執行一次，一直到n=5
		if high[n]>high[n-1]
		then count=count+1;
	end;
end;
//設定警示條件：if.. then ret=1;
if count>=3
then ret=1;
end;