{@type:indicator|@guid:c60da60f96e14200b266254ac0ddf08e|@path:/技術指標/KO能量潮指標|@hash:c99c7566bf78044989bc6461969b4ea6}
variable: kovolume(0);

value1=(close+high+low)/3;
if CurrentBar = 1 then
	kovolume = 0
else begin	
	if value1 > value1[1] then
		kovolume = kovolume[1] + volume
	else begin
		if value1 < value1[1] then
			kovolume = kovolume[1] - volume
		else
			kovolume = kovolume[1];
	end;		
end;
  
Plot1(kovolume, "KO能量潮指標");
		