{@type:function|@guid:75b83f4dc6e246339f29560623df2624|@path:/趨勢分析/SwingLow|@hash:40a25727de4a51f6665025000ac692e8}
SetBarMode(2);

input: Price(numericseries), Length(numericsimple), LeftStrength(numericsimple), RightStrength(numericsimple), occur(numericsimple);
//價格序列、時間長度、左區間、右區間、第幾個峰值

variable: now(0), tmpnow(0), cnt(0), success(0);

now = Rightstrength;
cnt = 0;

while cnt < occur and now < Length
begin
	success = 1;
	tmpnow = now+1;
	while success = 1 and tmpnow-now <= LeftStrength
	begin
		if Price[now] > Price[tmpnow] then
			success = 0
		else tmpnow = tmpnow+1;
	end;
	
	tmpnow = now-1;
	while success = 1 and now-tmpnow <= RightStrength
	begin
		if Price[now] >= Price[tmpnow] then
			success = 0
		else tmpnow = tmpnow-1;
	end;
	
	if success = 1 then
		cnt = cnt+1;
	now = now+1;
end;

if cnt < occur then
	SwingLow = -1
else
	swingLow = Price[now-1];