{@type:filter}
setbarfreq("AD");

variable:iHigh(0); iHigh=maxlist(iHigh,H);
variable:iLow(100000); iLow=minlist(iLow,L);
variable:hitlow(0),hitlowdate(0);
//觸低次觸與最後一次觸低日期
if iLow = Low then begin
	hitlow+=1;
	hitlowdate =date;
end;

if DateAdd(hitlowdate,"M",2) < Date and//如果自觸低點那天1個月後都沒有再觸低
iHigh/iLow < 1.3 and //波動在三成以內
iHigh = High
//來到設定日期以來最高點
then ret =1;

outputfield(1, highest(high[1],100), 2, "前波高點", order := -1);
