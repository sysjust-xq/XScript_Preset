{@type:filter}
input:period(250,"計算期間");
input:days(5,"計算買進的天數");
input:amount(3000,"大買的最低張數");
setbarfreq("D");
settotalbar(period+days);

value1=GetField("投信買張");
value2=summation(value1,days);
if countif(value2>=amount,period)>=1
then ret=1;
