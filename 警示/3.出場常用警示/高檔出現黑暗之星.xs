{@type:sensor}
input:Length(10); setinputname(1,"計算期數");

settotalbar(Length + 3);

if (open-close)>= open *0.025 then //最近一根是長黑棒
begin

	value1 = highest(high,length);
	value2 = lowest(low,length);
	
	if value1 = value2 then return;
	
	value3 = (value1-close)/(value1-value2)*100;

	condition1 = value3 < 10; //接近近n日高點
	condition2 = (close[2]-open[2])/open[2]>=0.03;//一根長陽線
	condition3 =  open[1]>close[1]  and (high[1]-low[1])<=close[1]*0.02 
	and close[1]>close[2] - 0.5*(close[1]-open[1]) ; //一根小黑棒且未形成覆蓋線

	if condition1 and condition2 and condition3 then ret=1;

end;