{@type:sensor}
input: shortlength(5,"短期均線期數");
input: midlength(20,"中期均線期數");
input: Longlength(60,"長期均線期數");
input: Percent(5,"均線糾結區間%");
input: XLen(6,"均線糾結期數");
variable:sv(0),mv(0),lv(0);
sv = average(close,shortlength);
mv = average(close,midlength);
lv = average(close,Longlength);	
variable: avgh(0),avgl(0),avghlp(0);	
AvgH = maxlist(sv,mv,lv );
AvgL = minlist(sv,mv,lv );
if AvgL > 0 then AvgHLp = 100*AvgH/AvgL -100;

input: Length1(14 , "威廉指標計算天數");
value1 = PercentR(Length1);
if trueAll(AvgHLp < Percent,XLen)
and value1>80
and close>close[1]*1.025
then ret=1;