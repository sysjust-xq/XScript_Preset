{@type:indicator}
input:Update(-1);

variable:hHigh(0),pC(0),iHigh(0),iLow(10000),iDate(0),ALow(0),ND(0),EP(0);
array:peak[300,5](0);


if currentbar = 1 then begin 
	iHigh =high; 
	iDate =Date; 
	value1=open; 
end;

hHigh = maxlist(high,hHigh); 
if hHigh > iHigh  then begin
	if iHigh <> iLow then begin
		peak[pc,0] = date;
		peak[pc,1] = iHigh;
		peak[pc,2] = iLow;
		peak[pc,3] = (iHigh- iLow)/iHigh*100;
		peak[pc,4] = datediff(date,iDate);
		if pc > 0  and peak[pc-1,2] <> 0 then peak[pc,5] = (iHigh/ peak[pc-1,2]-1)*100;
		pc+=1;
	end;
	iHigh =hHigh;
	iLOw = hHigh;
	iDate =Date;
end else 
	iLow =minlist(Low,iLow);

if  DateDiff(currentdate,date) > update and value1 > 0 and pc > 1 then begin
	variable: summ(0),avg(0); 
	summ=0; 
	for value2 = 1 to pc -1  
		summ += peak[value2,3]; 
	avg=summ/(pc-1);
	variable: summeans(0); 
	summeans=0;
	for value2 = 1 to pc -1 begin
		summeans += square(peak[value2,3]-avg);
	end;
	variable:stdev(0); 
	if pc-1 > 0 then 
		stdev = squareroot( summeans/(pc-1)) 
	else 
		stdev=0;
    variable:msg("Hold"),poLow(0);
	poLow = iHigh*(1- (avg+stdev)/100);
	if Close < PoLow then msg ="Sell";
end;

if date <>currentdate then ALow =Polow;
if C > alow and ALow > 0 then  plot1(Alow,"95%CF");  //95%信心水準回檔最大值
if C > iHigh*0.86 then begin
	plot3(iHigh*0.92,"N1D"); //第1減碼線
	plot4(iHigh*0.86,"N2D"); //第2減碼線
end;
plot5(Close,"現價");
plot6(V,"成交量");

ND=100*(average(H/L-1,20)+standarddev(H/L-1,20,1)*3);
if ND < 3 and trueall(ND[1]> 3,5) then  EP=h;
if ND < 5 and trueall(ND[1]> 5,5) then EP=h;
if c > EP and c[1] < EP then plot8(v,"作多點量");
if EP > 0 then plot9(EP,"關鍵價");