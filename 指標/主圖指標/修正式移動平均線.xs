{@type:indicator}
input:n(20,"計算期數");
variable: w(0);

if barfreq = "Tick" or barfreq = "Min" then
begin
	value1=GetField("內盤量");//單位:元
	value2=GetField("外盤量");//單位:元
end else begin
	value1=GetField("內盤量","D");//單位:元
	value2=GetField("外盤量","D");//單位:元
end;

//計算內外盤比
if value2<>0 then
	value3=value1/value2*100
else
	value3=100;

if close>close[1] then begin
	if value3>130 then 
		w=2.5
	else if value3>120 then
		w=2.2
	else if value3>110 then
		w=2.1
	else if value3>100 then
		w=1.9
	else
		w=1.8;
end else if value3<70 then 
		w=2.5
	else if value3<80 then 
		w=2.2
	else if value3<90 then 
		w=2.1
	else if value3<100 then 
		w=1.9
	else
		w=1.8;

value4=(w/(n+1))*close+(n-1)/(n+1)*value4[1];
value5=average(close,n);

plot2(value5,"移動平均線");



 

