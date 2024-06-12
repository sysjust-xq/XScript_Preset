{@type:filter}
input:r(6,"年預期報酬率單位%");
variable: s1(0);

value1=average(GetField("現金股利","Y"),5);

if lowest(GetField("現金股利","Y")[1],3)>0 then 
	s1=lowest(rateofchange(GetField("現金股利","Y"),1),3);

if value1>1 and r>s1 and s1>0then begin
	value2=value1/(r-s1)*100;
	if close<>0 then 
		value3=(value2-close)/close*100;
	if value3>10
	and GetField("現金股利","Y")>GetField("現金股利","Y")[1]
	then ret=1;
	
	outputfield(1,value1,1,"平均現金股利");
	outputfield(2,s1,1,"近年最低股利成長率");

end;
