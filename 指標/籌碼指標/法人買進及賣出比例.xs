{@type:indicator}
if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");
	
value1=GetField("外資買張");
value2=GetField("外資賣張");
value3=GetField("投信買張");
value4=GetField("投信賣張");
value5=value1+value3;
value6=value2+value4;
if volume <> 0 then begin
	value7=value5/volume*100;
	value8=value6/volume*100;
end;

plot1(value7,"法人買進比例");
plot2(value8,"法人賣出比例");
