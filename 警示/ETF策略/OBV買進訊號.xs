{@type:sensor|@guid:fd98c6104c834d068a40f91075c329c6|@path:/ETF策略/OBV買進訊號}
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
