{@type:filter|@guid:e8a1dea3f4df4e7e9356fa5833ca7ea5|@path:/08.財報選股/公司連續N年獲利大於X億}
input:lowlimit(1,",金額下單位億元");
input:period(10,"連續年度數");
value1=GetField("本期稅後淨利","Y");//單位百萬
if trueall(value1>lowlimit*100,period) 
then ret=1;
