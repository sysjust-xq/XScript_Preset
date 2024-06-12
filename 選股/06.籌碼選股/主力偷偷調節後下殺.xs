{@type:filter}
setbarfreq("AD");

input:period(10,"籌碼計算天期");
 
Value1=GetField("分公司買進家數","D");
value2=GetField("分公司賣出家數","D");
value3=(value1-value2);
//買進家數減去賣出家數，代表籌碼發散的情況
value4=average(close,5);
//計算發散程度的五日移動平均
 
if period<>0 then begin
	if countif(value3>10, period)/period >0.6
	//區間裡超過六成以上的日子主力都是站在出貨那一邊
	and linearregslope(value4,5)>0
	//發散程度之五日移動平均線短期趨勢是向上
	then ret=1;
end;

outputfield(1, countif(value3>10, period), 0, "出貨天數", order := 1);
