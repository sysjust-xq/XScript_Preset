{@type:filter}
if  close[1]*1.1<close[20]
and close>close[1]*1.025
and volume>average(volume,20)
then ret=1;

value1=getbaroffset(dateadd(GetField("除權息日期"),"D",-1));
outputfield(1,close[value1],2,"除權參考價");
outputfield(2,-RateOfChange(c,value1),2,"貼權率%", order := 1);
