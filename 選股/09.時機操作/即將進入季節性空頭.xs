{@type:filter}
setbarfreq("AM");
settotalbar(3);

array:m1[7](0);
variable:x(0),count(0),avgdn(0);

avgdn=0;

for x=1 to 7 begin
	m1[x]=(close[12*x-1]-close[12*x])/close[12*x];
end;
count=0;
for x=1 to 7 begin
	if m1[x]<-0.02 then begin
		count=count+1;
		avgdn=avgdn+m1[x];
	end;
end;

if count>=6 and close>10
and average(volume,20)>20000
then ret=1;
