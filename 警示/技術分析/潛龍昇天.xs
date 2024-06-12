{@type:sensor}
input:StartDate(20150301);
input:LowMonth(3);
 
if currentbar =1 and date < startdate then raiseruntimeerror("日期不夠遠");
 
variable:iHigh(0); iHigh=maxlist(iHigh,H);
variable:iLow(100000); iLow=minlist(iLow,L);
variable:hitlow(0),hitlowdate(0);
if iLow = Low then //觸低次觸與最後一次觸低日期
begin
hitlow+=1;
hitlowdate =date;
end;
 
if DateAdd(hitlowdate,"M",1) < Date and//如果自觸低點那天三個月後都沒有再觸低
iHigh/iLow < 1.3 and //波動在三成以內
iHigh = High then
 
//來到設定日期以來最高點
ret =1;