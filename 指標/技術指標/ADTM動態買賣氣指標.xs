{@type:indicator}
input: length(23);		setinputname(1, "天期");
input: period(8);		setinputname(2, "平均");

variable:DTM(0),DBM(0),STM(0),SBM(0),ADTM(0),ADTMMA(0);

if open > open[1] then 
	DTM = maxlist(high-open,open-open[1])
else
	DTM = 0;
   
if open < open[1] then 
	DBM = open-low
else 
    DBM = 0;

STM = Summation(DTM,length);
SBM = Summation(DBM,length);

if STM > SBM then 
	ADTM = (STM-SBM)/STM
else
  if STM < SBM then 
	ADTM = (STM-SBM)/SBM
  else 
    ADTM = 0;

ADTMMA = average(ADTM,period);

plot1(ADTM, "ADTM");
plot2(ADTMMA, "ADTM移動平均");
