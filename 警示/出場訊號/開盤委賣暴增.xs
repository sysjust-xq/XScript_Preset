{@type:sensor}
if close>close[90]*1.3 then begin
//先前有一定的漲幅
	value1=GetField("開盤委買","D");
	value2=GetField("開盤委賣","D");
	value3=value2-value1;
	if trueall(absvalue(value3[1])<250,10)
	//近十日開盤委買與開盤委賣張數差不多
	and value3>=500
	//今日開盤委賣比開盤委買多出500張以上
	and close<close[1]
	//收盤比前一日下跌
	and close<low*1.01
	//收盤接近當日最低價
	then ret=1;
end;
 