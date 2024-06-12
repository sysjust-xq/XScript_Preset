{@type:sensor}
variable: obvolume(0);

if CurrentBar = 1 then
	obvolume = 0
else begin	
	if close > close[1] then
		obvolume = obvolume[1] + volume
	else begin
		if close < close[1] then
			obvolume = obvolume[1] - volume
		else
			obvolume = obvolume[1];
	end;		
end;

value1=average(obvolume,20);

if obvolume crosses over value1*1.3 then ret=1;
