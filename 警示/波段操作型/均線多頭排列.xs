{@type:sensor}
input: shortlength(5,"短期均線期數");
input: midlength(10,"中期均線期數");
input: Longlength(20,"長期均線期數");
input: SuperLong(60,"超長期均線期數");
variable: shortaverage(0);
variable: midaverage(0);
variable: Longaverage(0);
variable: SuperLongaverage(0);

settotalbar(3);
setbarback(maxlist(shortlength,midlength,Longlength,SuperLong));

if Close > close[1] then
begin
 shortaverage=Average(close,shortlength);
 midaverage=Average(close,midlength) ;
 Longaverage = Average(close,Longlength); 
 SuperLongaverage = Average(close,SuperLong); 
 if  close>shortaverage and 
     shortaverage>midaverage and 
	 midaverage>Longaverage and 
	 Longaverage>SuperLongaverage
 then ret=1;
end;