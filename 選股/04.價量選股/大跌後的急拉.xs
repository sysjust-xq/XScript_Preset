{@type:filter}
setbarfreq("AD");

value1=barslast(close>=close[1]*1.07);
if value1[1]>50
//超過50天沒有單日上漲超過7%
and value1=0
//今天上漲超過7%
and average(volume,100)>500
and volume>1000
and close[1]*1.25<close[30]
//過去三十天跌幅超過25%
then ret=1;

outputfield(1,lowest(L,50),2,"前波低點", order := -1);
