{@type:indicator|@guid:87dbe85c64f94f16be7d9fce557940c4|@path:/技術指標/MF錢流指標|@hash:a9963a39e18b74ab38f9b7ce2b9ee09b}
INPUT:N(10,"期數");

variable: AP(0),tv(0),UTV(0),DTV(0),MF(0),UP(0),DN(0);

ap=(high+low+close)/3;
tv=ap*volume;
if ap>ap[1] then begin
	utv=tv;
	dtv=0;
end else begin
	utv=0;
	dtv=tv;
end;
up=UP[1]+(UTV-UP[1])/N;
DN=DN[1]+(DTV-DN[1])/N;
IF DN<>0 THEN 
	MF=100-(100/(1+UP/DN))
else
	MF=MF[1];
	
PLOT1(MF,"MF");