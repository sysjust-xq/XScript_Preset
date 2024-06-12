{@type:filter}
setbarfreq("AD");
settotalbar(50);

input:r1(50,"股本上限單位億");
input:day(30,"天期");
input:r2(15,"區間買超天數");
input:r3(5000,"區間合計買超張數");
input:r4(30,"漲幅上限");

value1=GetField("投信買張","D");
value2=GetField("最新股本");//單位:億

condition1=false;
condition2=false;
condition3=false;

if value2<r1
then condition1=true;//股本小於50億元

value3=countif(value1>50,day);
if value3>=r2
then condition2=true;//近30天裡有超過15天買超

if summation(value1,day)>r3
then condition3=true;//近30天合計買超超過5000張

if condition1 and condition2 and condition3
and close<close[day-1]*(1+r4/100)
then ret=1;

outputfield(1,summation(value1,day),0,"投信累計買進", order := 1);
