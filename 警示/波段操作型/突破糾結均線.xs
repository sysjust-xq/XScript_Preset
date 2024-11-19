{@type:sensor}
input: shortlength(5,"短期均線期數");
input: midlength(10,"中期均線期數");
input: Longlength(20,"長期均線期數");
input: Percent(5,"均線糾結區間%");
input: XLen(20,"均線糾結期數");
input: Volpercent(25,"放量幅度%"); //帶量突破的量是超過最長期的均量多少%

variable: Shortaverage(0),Midaverage(0),Longaverage(0);
variable: AvgHLp(0),AvgH(0),AvgL(0);

//透過Z的時間安排來決定現在用的是那一根Bar的資料 
variable: Z(0);
if currenttime > 180000 
or currenttime < 083000 then 
	Z =0 
else 
	Z=1;

Shortaverage = average(close,shortlength);
Midaverage = average(close,midlength);
Longaverage = average(close,Longlength);
AvgH = maxlist(Shortaverage,Midaverage,Longaverage);
AvgL = minlist(Shortaverage,Midaverage,Longaverage);

if AvgL > 0 then AvgHLp = 100*AvgH/AvgL -100;

condition1 = trueAll(AvgHLp < Percent,XLen);
condition2 = V > average(V[1],XLen)*(1+Volpercent/100) ;
condition3 = C > AvgH *(1.02) and H > highest(H[1],XLen);
condition4 = average(volume[1], 5) >= 1000; 
condition5 = tselsindex(10,6)=1;

if condition1 
and condition2 
and condition3 
and condition4 
and condition5[Z]
then ret=1;






