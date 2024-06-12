{@type:indicator}
input:p1(5,"短天期");
input:p2(20,"長天期");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

value1=GetField("主動買力");
value2=average(value1,p1);
value3=average(value1,p2);

plot1(value2,"主動買力短天期MA");
plot2(value3,"主動買力長天期MA");


