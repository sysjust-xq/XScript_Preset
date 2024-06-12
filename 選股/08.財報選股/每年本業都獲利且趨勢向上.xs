{@type:filter}
input:lm(200,"年營業利益下限");
settotalbar(5);

value1=GetField("營業利益","Y");//百萬
if trueall(value1>lm,5)
//週去五年都賺超過一億
and linearregslope(value1,5)>0
//五年的營業利益趨勢往上
then ret=1;