{@type:function}
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
	SwingLowBar = -1
else
	SwingLowBar = now-1;