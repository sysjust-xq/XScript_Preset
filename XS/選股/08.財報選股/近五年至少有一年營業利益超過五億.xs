{@type:filter|@guid:5e9fc3867a37436cbdf39d39c1c1a753|@path:/08.財報選股/近五年至少有一年營業利益超過五億}
input:years(5,"期間");
setbarfreq("Y");
settotalbar(5);

value1=GetField("營業利益","Y");//單位: 百萬
if highest(value1,years)>=500
then ret=1;