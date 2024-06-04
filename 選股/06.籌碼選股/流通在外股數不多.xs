{@type:filter|@guid:4c2a3f6c5fd9409793ce7d5777868a4a|@path:/06.籌碼選股/流通在外股數不多}
value1=GetField("最新股本");//單位:億
value2=GetField("董監持股佔股本比例","D");
value3=GetField("法人持股比例","D");
if value1*(1-value2/100-value3/100)<50
then ret=1;