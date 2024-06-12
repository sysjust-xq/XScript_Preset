{@type:filter}
input:ratio(200);		setinputname(1,"控盤者買張除以散戶買張的比例(%)");
input:volLimit(2000);	setinputname(2,"成交量下限(張)");

settotalbar(3);

value1=GetField("控盤者買張");
value2=GetField("散戶買張");
value3=value1/value2 * 100;

if volume > volLimit and value3 > ratio and value3[1] > ratio
then ret=1;

