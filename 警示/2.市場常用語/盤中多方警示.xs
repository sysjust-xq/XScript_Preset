{@type:sensor}
settotalbar(20);

array:intrabarpersist Trigger[20](True);

Array: intrabarpersist MK[330,6](0),intrabarpersist MD[7](1); {Time,Open,High,Low,Close,Volume}
variable:intrabarpersist BI(1),OT(090000){開盤時間},MF{KBbar頻率}(1);
if CurrentTime < TimeAdd(OT,"M",BI*MF) then 
begin  
MD[2]=MaxList(MD[2],C); MD[3]=MinList(MD[3],C);MD[4]=C; MD[7]+=q_TickVolume;
if BI =1 then  begin MD[1]=GetField("Open", "D");MD[2]=GetField("High", "D");MD[3]=GetField("Low", "D") ;end;
end else begin
MK[BI,0]=TimeAdd(OT,"M",BI-1);MK[BI,1]=MD[1];MK[BI,2]=MD[2];MK[BI,3]= MD[3];MK[BI,4]= MD[4];MK[BI,5]=GetField("Volume", "D")-q_TickVolume-MD[5];            
BI+=1; MD[1]=C;MD[2]=C;MD[3]=C;MD[4]=C; MD[5]=GetField("Volume", "D")-q_TickVolume; MD[7]=q_TickVolume;
end;

array:intrabarpersist Q1[100,3](90000),intrabarpersist Q2[10,3](90000),intrabarpersist QI[5,5](0); QI[1,4] = 99; QI[2,4] = 9; 
variable:QD(1);
for QD = 1 to 2
begin
if QI[QD,1] < QI[QD,4] then QI[QD,1]+=1 else QI[QD,1]=0; 
if QI[QD,1] =0 then QI[QD,2]=QI[QD,4] else QI[QD,2]=QI[QD,2]-1; 
if QI[QD,1] =QI[QD,4] then QI[QD,3]=0 else QI[QD,3]=QI[QD,1]+1;
end;
Q1[QI[1,1],0] = currenttime;Q1[QI[1,1],1] = Close;Q1[QI[1,1],2] = q_TickVolume;     
Q2[QI[2,1],0] = currenttime;Q2[QI[2,1],1] = Close;Q2[QI[2,1],2] = q_TickVolume;     


{=============}
variable:TA1(-1),TA2(-1),AVGX(10000);
if Date = currentdate then begin
if TA1 = -1  then TA1 = Countif( GetField("融資增減張數")[1]<0,10);
variable: forceratio(0);
if V[1] > 0 then forceratio = GetField("主力買賣超張數")[1]/V[1] else forceratio = forceratio[1];
if TA2 = -1 then TA2 = Summation(forceratio,10);
if AVGX =10000 then AVGX = Average(Close,5);{五日}
end;
{=============}

{開盤處理融資追繳後的反彈}
if Trigger[19] then  if currenttime < 093000 and Close > Low *1.02 and Close > Open and  V > V[1]*0.6 and  TA1=10{融資增減張數之減少天數}
and Low = Lowest(Low,20) and Low < Highest(high,20)*0.7 then  begin ret=1; trigger[19]=false; end;
if h > highest(h[1],8) and v < highest(v[1],18)*BI/135 then return; 
{過濾} 
if Close = GetField("漲停價", "D") or Close < highest(high,10)*0.95 or GetField("均價")*GetField("Volume", "D") < 10000{仟元}   
   or Close < GetField("Volume", "D")*0.985 or Date <currentdate 
   or Close > AVGX*1.25 or Close > C[5]*1.25   then return;

{1.1分鐘線爆量上漲}
if Trigger[1] then  if MD[7] > (V[1]+V)/(270+BI)*3 and Close > MD[1]*1.01  then begin ret=1; trigger[1]=false; end;
{2.5分鐘線3連陽}
if Trigger[2] then  if BI >= 15 and MK[BI,4]> MK[BI-4,1] and MK[BI-5,4]> MK[BI-9,1] and MK[BI-10,4] > MK[BI-14,1] then begin ret=1; trigger[2]=false; end;
{3.連日盤整後急拉}
if Trigger[3] then  if Close > Q2[QI[2,3],1]*1.015 and TimeDiff(currenttime, Q2[QI[2,3],0],"M") <5 and TrueAll(absvalue(high[1]/low[1]-1) < 0.03,10) then begin ret=1; trigger[3]=false; end;
{4.主動性買盤大增} variable: AvgOutSideVol(averageIF( close > close[1] ,volume,15));
if Trigger[4] then if GetField("外盤量", "D") > AvgOutSideVol*1.5 then begin ret=1; trigger[4]=false; end;
{5.多頭波動表態}   variable:STDEV(standarddev(High[1]-Low[1],15,1)*3);
if Trigger[5] then if q_PriceChangeRatio >3{%} and Volume*GetField("均價") > 30000{仟元} and  High > Low + average(High[1]-Low[1],15)+STDEV then begin ret=1; trigger[5]=false; end;
{6.多方放量待起漲} variable:VSTDEV(standarddev(volume,15,1)*3);
if Trigger[6] then if q_PriceChangeRatio>2{%} and  volume > average(volume[1],15)+3*VSTDEV and close > highest(high[1],15)*0.965 then begin ret=1; trigger[6]=false; end;
{7.連日強攻再滾量攻高}
if Trigger[7] then  if BI>3 and  Close > High[1] and (MK[BI,5]+MK[BI-1,5]+MK[BI-2,5])*GetField("均價") > 10000{仟元} and CountIF(high>high[1],10) > 7 then begin ret=1; trigger[7]=false; end;
{8.10個1分鐘階梯連漲} variable:Steps(true); 
if Trigger[8] then if BI>10 then begin for QD=0 to 9   begin    Steps  = Steps and (MK[BI-QD,4]>MK[BI-1-QD,4]); end;  if Steps then begin ret=1; trigger[8]=false; end; ;end;  
{9.多方人氣急增}
if Trigger[9] then if BI>4  and q_PriceChangeRatio > 2{%} and MK[BI,4]> MK[BI-1,1]  and MK[BI-1,4]> MK[BI-3,1]  and (TimeDiff( currenttime, Q1[QI[1,3],0],"S")- TimeDiff(currenttime, Q2[QI[2,3],0],"S"))/90 > TimeDiff(currenttime, Q2[QI[2,3],0],"S")*3/10 then begin ret=1; trigger[9]=false; end;
{10.主力決心作價}
if Trigger[10] then if  V*GetField("均價")> 30000{仟元} and TA2{"主力買賣超張數"} > 0.33 and high= Highest(High,10) then  begin ret=1; trigger[10]=false; end;
{11.開盤快速急攻}
if Trigger[11] then if CurrentTime < 091500  and q_PriceChangeRatio >2{%} and Volume*GetField("均價") > 30000{仟元}  and high =Highest(High,15)  and  High > Low[1] + average(High[1]-Low[1],15)+STDEV then begin ret=1; trigger[11]=false; end;
{12.2%門前急拉} 
if Trigger[12] then if Q2[QI[2,1],1] < GetField("RefPrice", "D") *1.02 and close >= GetField("RefPrice", "D") *1.02 and  Close * q_TickVolume >500{仟元} and  Close > Q2[QI[2,3],1]*1.01  and   timediff(Currenttime,Q2[QI[2,3],0],"M")< 3{分鐘}  then begin ret=1; trigger[12]=false; end;    {3分鐘內快速拉升}
{13.下殺後反彈過今高}
if Trigger[13] then if Close > GetField("RefPrice", "D") and Close > GetField("Open", "D") and  Close = GetField("Volume", "D") and  Close >= GetField("Low", "D")*1.02 then begin ret=1; trigger[13]=false; end;
{14.帶量衝新高}
if Trigger[14] then if Close = GetField("Volume", "D") and Close > highest(H[1],20)  and Close*q_TickVolume > 3000  then begin ret=1; trigger[14]=false; end;
{15.開盤15分鐘一路向上不回頭} variable:Counter(0);
if Trigger[15] then  If BI =15 then  for QD =0 to 13  if MK[BI-QD,4] > MK[BI-1-QD,4] then Counter+=1;  if Counter > 12 then begin ret=1; trigger[15]=false; end;