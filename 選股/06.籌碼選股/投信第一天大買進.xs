{@type:filter}
value1=GetField("最新股本");//單位:億
value2=GetField("投信買張","D");
value3=value2*close/10;  //單位:萬}

 
 
condition1=value3>200 and value1<80;
 
condition2=filter(condition1,5);

if condition2 
then ret=1;



