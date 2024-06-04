{@type:filter|@guid:b2eb9c0e9be442d8833927cf39fc343d|@path:/08.財報選股/每年本業都獲利且趨勢向上}
input:lm(200,"年營業利益下限");
settotalbar(5);

value1=GetField("營業利益","Y");//百萬
if trueall(value1>lm,5)
//週去五年都賺超過一億
and linearregslope(value1,5)>0
//五年的營業利益趨勢往上
then ret=1;