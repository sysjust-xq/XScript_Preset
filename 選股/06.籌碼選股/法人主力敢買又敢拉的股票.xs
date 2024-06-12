{@type:filter}
value1=GetField("法人買賣超張數");
value2=GetField("主力買賣超張數");
value3=value1+value2;
value4=GetField("內外盤比","D");//外盤量/內盤量*100

condition1=false;
condition2=false;
condition3=false;

if countif(value3>300,5)>=4 or countif(value3>300,4)>=3
then condition1=true; 

if value3>volume*0.3 and value4>50
then condition2=true;

if high<=close*1.02
then condition3=true;

if condition1 and condition2 and condition3
then ret=1;

 