{@type:indicator}
input:period(5,"加權移動平均線天期");

//當日向上拉動的力量
value1=(high-open)+(close-low);
//當日向下殺盤的力量
value2=(open-low)+(high-close);
if close<>0 then begin
	//上拉力道
	value3=average(value1,period)/close*100;
	//下殺力道
	value4=xaverage(value2,period)/close*100;
end;
value5=value3-value4;
plot1(value5,"上拉下殺淨力道");
 
