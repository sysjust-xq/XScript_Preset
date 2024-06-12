{@type:filter}
input:days(10,"計算期間");
input:vhilimit(1000,"量的上限");
input:philimit(5,"價格波動上限");
setbarfreq("D");
settotalbar(days);

value1=highest(high,days);
value2=lowest(low,days);
value3=(value1-value2)/value2*100;
if trueall(volume<vhilimit,days)
and trueall(value3<philimit,days)
then ret=1;