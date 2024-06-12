{@type:sensor}
input: Length_D(9, "日KD期間");
input: Length_W(5, "周KD期間");
variable:rsv_d(0),kk_d(0),dd_d(0);
variable:rsv_w(0),kk_w(0),dd_w(0);

SetTotalBar(maxlist(Length_D,6) * 3);

//透過Z的時間安排來決定現在用的是那一根Bar的資料 
variable: Z(0);
if GetFieldDate("主力買賣超張數") <> 0 then
	Z=0 
else 
	Z=1;
	
condition1=false;
value1=GetField("現股當沖張數","D")[Z];
value2=GetField("外資買賣超","D")[Z];
value3=GetField("投信買賣超","D")[Z];
value4=GetField("自營商買賣超","D")[Z];
value5=GetField("主力買賣超張數","D")[Z];
value6=GetField("融資增減張數","D")[Z];
value7=GetField("融券增減張數","D")[Z];
value8=volume-value1;//當日淨交易張數
value9=value2+value3+value4+value5-value6+value7;
//籌碼收集張數

if TSELSindex(10,5)[Z]=1 then begin
	if value8<>0 then 
		value10=value9/value8*100
	else
		value10=value10[1];
	
	value11=average(value10,10);
	if value11 crosses over 10 then condition1=true;

	stochastic(Length_D, 3, 3, rsv_d, kk_d, dd_d);
	xf_stochastic("W", Length_W, 3, 3, rsv_w, kk_w, dd_w);

	condition2 = kk_d crosses above dd_d;		// 日KD crosses over
	condition3 = xf_GetBoolean("W",xf_crossover("W", kk_w, dd_w),1);	// 周KD crosses over
	condition4 = kk_d[1] <= 30;							// 日K 低檔
	condition5 = xf_getvalue("W", kk_w, 1) <= 50;		// 周K 低檔
	
	if condition1 and condition2 and condition3 and condition4 and condition5
	then ret = 1;
end;
