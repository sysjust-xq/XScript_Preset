{@type:sensor}
input:period(200,"天數");
variable: ld(0),hd(0),ldb(0),hdb(0),count(0),x1(0);

//透過Z的時間安排來決定現在用的是那一根Bar的資料 
variable: Z(0);
if currenttime > 180000 
or currenttime < 083000 then 
	Z =0 
else 
	Z=1;
	
count=0;
ld=lowest(low,period);
ldb=lowestbar(low,period);
hd=highest(high,period);
hdb=highestbar(high,period);
x1=GetField("總市值","D")[Z];//單位：億

if hdb>ldb and hd>ld*1.4 and ld>=ld[1] and x1>20 then begin
//股價大跌後
	value1=countif((close-open)/open>1.5,ldb);
	//自最低點以來的中長紅K棒數
	if value1>=ldb/5 then count=count+1;
	
	value2=summationif(close>close[1],volume,ldb);
	//自最低點以來的上漲量
	value3=summationif(close<close[1],volume,ldb);
	//自最低點以來的下跌量
	if value2>2*value3 then count=count+1;
	
	value4=nthlowestbar(2,low,ldb);
	//第二個低點的k棒位置
	value5=nthlowestbar(3,low,ldb);
	//第三個低點的K棒位置
	value6=nthlowestbar(4,low,ldb);
	//第四個低點的K棒位置
	if value4>value5 and value5>value6 then count=count+1;
	
	value7=countif(absvalue(close[1]/close-1)/close[1]*100<1 and close<close[1],ldb);
	//自低點以來的小黑棒K棒數
	if value7>0.5*countif(close<close[1],ldb) then count=count+1;
	//小黑k棒佔下跌k棒超過一半

	value8=countif(close>low*1.01,ldb);
	//自低點以來的長下影線天數
	if value8 >=ldb/5 then count=count+1;

	value9=countif(close=high,ldb);
	//自低點以來收最高的天數
	if value9>=ldb/5 then count=count+1;

	if ldb>=5 then count=count+1;
end;

if count[1]>2 and count crosses over 5 then ret=1;
