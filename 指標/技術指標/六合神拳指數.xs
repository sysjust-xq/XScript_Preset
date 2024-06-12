{@type:indicator}
input:length1(6,"短天期RSI參數");
input:length2(10,"長天期RSI參數");
input:length3(10,"MTM天期");
input:length4(10,"DMI天期");

variable:count(0);

count=0;
if RSI(Close, Length1) > RSI(Close, Length2)
and rsi(close,length1)<50 then
	count=1;
if Momentum(Close, Length3) > 0 then
	count=count+1;

variable:pdi_value(0);
variable:ndi_value(0);
variable:adx_value(0);
directionmovement(length4,pdi_value,ndi_value,adx_value);
if pdi_value > ndi_value then 
	count=count+1;
	

variable:rsv1(0),k1(0),d1(0);
stochastic(9,3,3,rsv1,k1,d1);
if k1 > d1 then 
	count=count+1;

value1=average(volume,10);
if linearregslope(value1,8)>0 then
	count=count+1;

value2=average(close,8);
if linearregslope(value2,5)>0 then
	count=count+1;
	
plot1(count,"分數");
