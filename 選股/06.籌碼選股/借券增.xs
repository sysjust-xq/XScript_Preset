{@type:filter}
input:lowlimit(200,"借券增加張數");
input:days(3,"計算天數");
setbarfreq("D");
settotalbar(3);

value1=GetField("借券賣出餘額張數","D")-GetField("借券賣出餘額張數","D")[days];//借券賣出餘額張數增加數
if value1>=lowlimit
then ret=1;

outputfield(1,value1,"借券賣出餘額張數增加數");
