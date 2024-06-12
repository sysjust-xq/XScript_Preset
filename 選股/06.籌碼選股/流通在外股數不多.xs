{@type:filter}
value1=GetField("最新股本");//單位:億
value2=GetField("董監持股佔股本比例","D");
value3=GetField("法人持股比例","D");
if value1*(1-value2/100-value3/100)<50
then ret=1;