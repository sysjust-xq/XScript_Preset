{@type:function}
SetBarMode(2);

// 利用多種指標, 計算多空分數
//
variable: count(0);

// 每次計算都要reset
count = 0;

//------------------ Arron指標 -------------------//
variable: arron_up(0),arron_down(0),arron_oscillator(0);//arron oscillator
arron_up=(25-nthhighestbar(1,high,25))/25*100;
arron_down=(25-nthlowestbar(1,low,25))/25*100;
arron_oscillator=arron_up-arron_down;
if arron_up > arron_down and arron_up > 70 and arron_oscillator > 50
then count=count+1;

//------------------ 隨機漫步指標 ---------------//
variable: RWIH(0),RWIL(0);
value1 = standarddev(close,10,1);
value2 = average(truerange,10);
if value1 <> 0 and value2 <> 0 then
begin
  RWIH=(high-low[9])/value2*value1;
  RWIL=(high[9]-low)/value2*value1;
end;
  
if RWIH > RWIL
then count=count+1;

//------------------ 順勢指標 -------------------//
variable:bp1(0),abp1(0);
if truerange <> 0 then  
	bp1=(close-close[1])/truerange*100;//順勢指標

abp1=average(bp1,10);
if abp1 > 0
then count=count+1;

//---------- CMO錢德動量擺動指標 ----------------//
variable:SU(0),SD(0),CMO1(0), SUSUM(0), SDSUM(0);

if close >= close[1] then 
	SU=CLOSE-CLOSE[1]
else
	SU=0;

if close < close[1] then 
	SD=CLOSE[1]-CLOSE
else
	SD=0;

SUSUM = summation(SU,9);
SDSUM = summation(sd,9);
if (SUSUM+SDSUM) <> 0 then 
	cmo1=(SUSUM-SDSUM)/(SUSUM+SDSUM)*100;

if linearregslope(cmo1,5) > 0
then count=count+1;

//------------------ RSI指標 -------------------//
variable: rsiShort(0), rsiLong(0);
rsiShort=rsi(close,5);
rsiLong=rsi(close,10);
if rsiShort > rsiLong and rsiShort < 90
then count=count+1;

//----------------- MACD指標 -------------------//
variable: Dif_val(0), MACD_val(0), Osc_val(0);  
MACD(Close, 12, 26, 9, Dif_val, MACD_val, Osc_val); 
if osc_val > 0
then count=count+1;

//----------------- MTM指標 -------------------//
if mtm(10) > 0
then count=count+1;

//----------------- KD指標 --------------------//
variable:rsv1(0),k1(0),d1(0);
stochastic(9,3,3,rsv1,k1,d1);
if k1 > d1 and k1 < 80
then count=count+1;

//----------------- DMI指標 -------------------//
variable:pdi_value(0),ndi_value(0),adx_value(0);
DirectionMovement(14,pdi_value,ndi_value,adx_value);
if pdi_value > ndi_value 
then count=count+1; 

//----------------- AR指標 -------------------//
variable: arValue(0);
arValue = ar(26);
if linearregslope(arValue,5) > 0
then count=count+1;

//----------------- ACC指標 -----------------//
if acc(10) > 0
then count=count+1;

//----------------- TRIX指標 ----------------//
if trix(close,9) > trix(close,15)
then count=count+1;

//----------------- SAR指標 ----------------//
if close > SAR(0.02, 0.02, 0.2)
then count=count+1;

//----------------- 均線指標 ----------------//
if average(close,5) > average(close,12)
then count=count+1;

// Return value
//
ret = count;
