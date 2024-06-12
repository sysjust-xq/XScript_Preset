{@type:function}
SetBarMode(2);

input: 
Price(numericseries), 
Length(numericsimple), 
LeftStrength(numericsimple), 
RightStrength(numericsimple), 
occur(numericsimple);
//價格序列、時間長度、左區間、右區間、第幾個峰值

variable: now(0), tmpnow(0), cnt(0), success(false);

now = Rightstrength;
cnt = 0;

while cnt < occur and now < Length
begin
	success = true;
	tmpnow = now+1;
	while success = true and tmpnow-now <= LeftStrength
	begin
		if Price[now] < Price[tmpnow] then
			success = false
		else tmpnow = tmpnow+1;
	end;
	
	tmpnow = now-1;
	while success = true and now-tmpnow <= RightStrength
	begin
		if Price[now] <= Price[tmpnow] then
			success = false
		else tmpnow = tmpnow-1;
	end;
	
	if success = true then
		cnt = cnt+1;
		
	now = now+1;
end;

if cnt < occur then
	swingHighBar  = -1
else
	swingHighBar  = now-1;