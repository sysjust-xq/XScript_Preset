{@type:sensor}

{三次到頂而破}
variable:CaliPrice(0),peakIndex(0),MaxPeak(0);
Array:peakDate[50](0),peakPrice[50](0),LongTrendPercent[50](0);
CaliPrice = (High[0]+Low[0]+Close[0])/3;

if CaliPrice[2] = MaxList(CaliPrice ,CaliPrice[1],CaliPrice[2],CaliPrice[3],CaliPrice[4]) and High[2] > CaliPrice[4]*1.02 and High[2] > CaliPrice[0]*1.02  then begin
	peakDate[peakIndex] = Date[2];peakPrice[peakIndex] = High[2];
	if peakIndex = 0 then LongTrendPercent[peakIndex]  = ( High[2]/ Close[2+20]-1)*100;
	if peakIndex > 0 and DateDiff(date,peakDate[peakIndex-1]) >5 then LongTrendPercent[peakIndex]  = ( High[2]/ Close[2+20]-1)*100;
	peakIndex+=1;
end;

if Date=CurrentDate  and Close > Open then begin

  if peakIndex >2 and Absvalue(peakPrice[peakIndex-1]/ peakPrice[peakIndex-2]-1 )< 0.01 and DateDiff(Date, peakDate[peakIndex-1])>20 then condition1 =true ;
  if  condition1  and  Close*1.065   >  highest(high[1],100) and
    minlist(low[100],low[99],low[98],low[97],low[96]) = Lowest(Low,100) and
    peakIndex >3 and LongTrendPercent[peakIndex-2] >20 and 
    Absvalue( peakPrice[peakIndex-1]/ peakPrice[peakIndex-2]-1 )< 0.01 and 
    DateDiff( peakDate[peakIndex-2] ,peakDate[peakIndex-3]) > 20 and 
    DateDiff( peakDate[peakIndex-1] ,peakDate[peakIndex-2]) > 5 and 
    Date < DateAdd(peakDate[peakIndex-1],"D",20)  
    then begin
    MaxPeak =MaxList(peakPrice[peakIndex-1],peakPrice[peakIndex-2]);
    if  Close > MaxPeak*1.005  and C>O then ret=1; 
    end;
end;

{激烈波動}
if Date =currentdate then  begin
	variable:STDEV(standarddev(volume[1],19,1)*3);
	if C>O and Volume*GetField("均價") > 30000{仟元} and  Close > High*0.99 and high = highest(high,20) and highest(high[1],19)/lowest(Low[1],19) - 1 <0.065 and 
	   TrueAll(ABSValue(high[1]/low[1]-1)<0.04,15) and  Volume > average(Volume[1],19)+STDEV then ret=1;   
end;

{波段初漲}
variable:hHigh(0),pC(0),iHigh(0),iLow(10000),iDate(0),eLow(10000);
if DateDiff(currentdate,date) < 93 then begin 	
    eLow = minlist(low,elow);
	if DateDiff(currentdate,date) >=90 then begin iHigh =high; iDate= Date; value1=open; end;
	hHigh = maxlist(high,hHigh); 
	if eLow = Low then hHigh = low;
	if hHigh > iHigh  then begin
	if C>O and iHigh<> iLow and close> eLow*1.08 and DateDiff(Date,iDate)> 30 and v>500 then  ret=1;
	iHigh =hHigh;iLOw = hHigh;iDate =Date;
	end else iLow =minlist(Low,iLow);
end;

{突破均線極度糾結}
variable:VSTDEV(1000000),PSTDEV(1000),AVG1(0),AVG2(0),AVG3(0),AVG4(0);
 AVG1 = average(close,5);AVG2 = average(close,10);AVG3 = average(close,20);AVG4 = average(close,60);
 if Date = currentdate then   begin
   VSTDEV=standarddev(volume[1],19,1)*3;
   PSTDEV=standarddev(H[1]-L[1],19,1)*3;
   if volume < average(Volume[1],19)+VSTDEV  or (C-O)/(H-L) < 0.7 then return;
   if C>O and Close  > maxlist(AVG1,AVG2,AVG3,AVG4)  and C > L +PSTDEV and  TrueAll( H[1]/L[1]-1 < 0.07,20) and 
       TrueAll(maxlist(AVG1,AVG2,AVG3,AVG4)/Maxlist( Minlist(AVG1,AVG2,AVG3,AVG4),0.01)-1 < 0.035,20) then ret=1;
 end;
