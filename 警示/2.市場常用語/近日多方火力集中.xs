{@type:sensor}
settotalbar(10);

variable:CDay(3);
variable:i(1),XData(0),XDataAmount(0),XAmount(0),XV(0),XPrice(0),Trigger(False);

if Currenttime > 170000  or Currenttime < 083000 then i=0; 
Trigger=False;
XAmount =Summation(GetField("成交金額")[i],CDay);XV = Summation(V[i],CDay);XPrice = XAmount/XV/1000;
XDataAmount = Summation(GetField("主力買賣超張數")[i],CDay)/XV; if XDataAmount>0.2 and trueall( XDataAmount[1]<0.1,5) then Trigger=true;
XDataAmount = Summation(GetField("實戶買賣超張數")[i],CDay)/XV; if XDataAmount>0.25 and trueall( XDataAmount[1]<0.1,5) then Trigger=true;
XDataAmount = Summation(GetField("控盤者買賣超張數")[i],CDay)/XV; if XDataAmount>0.25 and trueall( XDataAmount[1]<0.1,5) then Trigger=true;
if C[i]> XPrice and  V>300 and Trigger then ret=1;


variable:iHigh(0),iDate(0);
if high > iHigh then begin iHigh= high;iDate= Date; end;
if DateDiff(Date,iDate) >30  and C > iHigh *0.935 and C<iHigh and
   (Summation(GetField("外資買賣超")[i]*XPrice,CDay) > 30000 or
    Summation(GetField("投信買賣超")[i]*XPrice,CDay) > 30000 or
	Summation(GetField("自營商買賣超")[i]*XPrice,CDay) > 30000)
then ret=1; 
