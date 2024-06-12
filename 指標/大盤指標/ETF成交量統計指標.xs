{@type:indicator}
array:ETF[50](0);
etf[1]=GetSymbolField("0050.tw","成交金額");
etf[2]=GetSymbolField("0051.tw","成交金額");
etf[3]=GetSymbolField("0052.tw","成交金額");
etf[4]=GetSymbolField("0053.tw","成交金額");
etf[5]=GetSymbolField("0054.tw","成交金額");
etf[6]=GetSymbolField("0055.tw","成交金額");
etf[7]=GetSymbolField("0056.tw","成交金額");
etf[8]=GetSymbolField("0057.tw","成交金額");
etf[9]=GetSymbolField("0058.tw","成交金額");
etf[10]=GetSymbolField("0059.tw","成交金額");
etf[11]=GetSymbolField("0061.tw","成交金額");
etf[12]=GetSymbolField("006201.tw","成交金額");
etf[13]=GetSymbolField("006203.tw","成交金額");
etf[14]=GetSymbolField("006204.tw","成交金額");
etf[15]=GetSymbolField("006205.tw","成交金額");
etf[16]=GetSymbolField("006206.tw","成交金額");
etf[17]=GetSymbolField("006207.tw","成交金額");
etf[18]=GetSymbolField("006208.tw","成交金額");
etf[19]=GetSymbolField("00631L.tw","成交金額");
etf[20]=GetSymbolField("00632R.tw","成交金額");
etf[21]=GetSymbolField("00633L.tw","成交金額");
etf[22]=GetSymbolField("00634R.tw","成交金額");
etf[23]=GetSymbolField("00635U.tw","成交金額");
etf[24]=GetSymbolField("00636.tw","成交金額");
etf[25]=GetSymbolField("00637L.tw","成交金額");
etf[26]=GetSymbolField("00638R.tw","成交金額");
etf[27]=GetSymbolField("00639.tw","成交金額");
etf[28]=GetSymbolField("00640L.tw","成交金額");
etf[29]=GetSymbolField("00641R.tw","成交金額");
etf[30]=GetSymbolField("00642U.tw","成交金額");
etf[31]=GetSymbolField("00643.tw","成交金額");
etf[32]=GetSymbolField("00645.tw","成交金額");
etf[33]=GetSymbolField("00646.tw","成交金額");
etf[34]=GetSymbolField("00647L.tw","成交金額");
etf[35]=GetSymbolField("00648R.tw","成交金額");
etf[36]=GetSymbolField("00649.tw","成交金額");
etf[37]=GetSymbolField("00650L.tw","成交金額");
etf[38]=GetSymbolField("00651R.tw","成交金額");
etf[39]=GetSymbolField("00652.tw","成交金額");
etf[40]=GetSymbolField("00653L.tw","成交金額");
etf[41]=GetSymbolField("00654R.tw","成交金額");
etf[42]=GetSymbolField("00655L.tw","成交金額");
etf[43]=GetSymbolField("00656R.tw","成交金額");
etf[44]=GetSymbolField("00657.tw","成交金額");
etf[45]=GetSymbolField("00658L.tw","成交金額");
etf[46]=GetSymbolField("00659R.tw","成交金額");
etf[47]=GetSymbolField("00660.tw","成交金額");
etf[48]=GetSymbolField("00661.tw","成交金額");
etf[49]=GetSymbolField("00662.tw","成交金額");
etf[50]=GetSymbolField("008201.tw","成交金額");

value1=array_sum(etf,1,50);

if volume<>0 then 
	value3=value1/volume*100;
plot1(value3);


 


