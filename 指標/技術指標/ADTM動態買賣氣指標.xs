{@type:indicator|@guid:e06fa82c48fe4213936cb153d22ca3a6|@path:/技術指標/ADTM動態買賣氣指標|@hash:a13bc2304c49fdfcbf86e9907e287b5e}
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
