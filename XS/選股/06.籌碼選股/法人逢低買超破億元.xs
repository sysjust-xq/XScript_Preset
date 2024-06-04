{@type:filter|@guid:36c5c249a3b944f69bcdc02fb6e91ccf|@path:/06.籌碼選股/法人逢低買超破億元}
input:day(5,"計算期別");
input:lowlimit(1,"單位:億元");
setbarfreq("D");
settotalbar(day);

value1=GetField("法人買賣超張數","D");
value2=summation(value1,day);
value3=value1*value2/10000;

if value3>=1 
and close*1.1<close[30]
then ret=1;
