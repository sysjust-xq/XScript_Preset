{@type:indicator}
{
指標說明
https://xstrader.net/多空點數指標/
}

variable:i(0),Lscore(0),Sscore(0);

Lscore=0;
Sscore=0;

for i = 1 to 100 begin
	if C> H[i] then 
		Lscore += 1 
	else if C < L[i] then 
		Sscore += 1;
end;
PLOT1(LSCORE-SSCORE,"多空點數");
