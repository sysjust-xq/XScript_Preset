{@type:indicator|@guid:8255457751d440bc97fde9d5422b1969|@path:/技術指標/蔡金波動指標|@hash:2f2ca7b7ae6fb58827da67fce30a8ba1}
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
