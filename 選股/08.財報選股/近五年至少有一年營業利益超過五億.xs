{@type:filter}
input:years(5,"期間");
setbarfreq("Y");
settotalbar(5);

value1=GetField("營業利益","Y");//單位: 百萬
if highest(value1,years)>=500
then ret=1;