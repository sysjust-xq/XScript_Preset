{@type:filter|@guid:d3e2bb1f10184fbd8a53f96c4e18c177|@path:/06.籌碼選股/近N日主力合計買超大於M張}
value1=GetField("主力買賣超張數","D");
input:days(5,"計算天期");
input:lowmit(200,"買超最低張數");
if summation(value1,days)>=lowmit
then ret=1;