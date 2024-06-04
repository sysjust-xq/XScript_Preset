{@type:filter|@guid:27beb72ef00644d087f465a3dac75363|@path:/04.價量選股/多日價量背離後跌破}
setbarfreq("AD");

input:Length(5, "計算期數");
input:times(3, "價量背離次數");
input:Dist(20, "距離");

variable:count(0),KPrice(0),hDate(0);

count = CountIf(close > close[1] and volume < volume[1], Length);

if count > times then  begin
  hDate=Date;
  Kprice = lowest(l,length);
end;

Condition1 = Close crosses below Kprice;
Condition2 = DateDiff(Date,hdate) < Dist;
Ret = Condition1 And Condition2;

outputfield(1,Kprice,2,"關卡價", order := -1);
