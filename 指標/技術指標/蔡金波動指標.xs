{@type:indicator}
input:length(9,"期數");

variable:REMA(0),cv1(0);

if currentbar=1 then begin
	cv1=0;
end else if range<>0 then begin
	REMA=xaverage(range,length);
	if rema[length-1]=0 then 
		cv1=cv1[1]
	else 
		cv1=(REMA-REMA[length-1])/rema[length-1];
end;
plot1(cv1,"波動率");
