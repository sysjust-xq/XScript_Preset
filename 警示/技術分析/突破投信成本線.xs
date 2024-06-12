{@type:sensor}
//小型股
input: pastDays(3); setinputname(1,"計算天數");
input: _BuyRatio(10); setinputname(2,"買超佔比例(%)");
 
variable: SumAm(0),SumForce(0), SumTotalVolume(0),APrice(0),AVGP(0),Kprice(0),QDate(0);
 
if V[1] <> 0 then
	APrice = GetField("成交金額")[1] / V[1]/1000;
 
SumAm = Summation(GetField("投信買賣超")[1]*APrice, pastDays);
SumForce = Summation(GetField("投信買賣超")[1], pastDays);
 
sumTotalVolume = Summation(Volume[1], pastDays);
 
if SumAm > 30000 and SumForce > SumTotalVolume * _BuyRatio/100 then
begin
Kprice =highest(avgprice,pastDays);
QDate=Date;
end;
 
if DateDiff(Date,QDate) < pastDays+5 and C > Kprice and C[1] < Kprice then ret=1;