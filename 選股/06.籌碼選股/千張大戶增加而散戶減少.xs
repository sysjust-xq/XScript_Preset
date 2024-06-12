{@type:filter}
setbarfreq("W");
settotalbar(3);

condition1 = GetField("大戶持股人數","W",param:=1000)>GetField("大戶持股人數","W",param:=1000)[1];
condition2 = GetField("散戶持股人數","W",param:=400)<GetField("散戶持股人數","W",param:=400)[1];

if condition1 and condition2 then ret=1;

outputfield(1,GetField("大戶持股人數","W",param:=1000),0,"本週大戶人數");
outputfield(2,GetField("大戶持股人數","W",param:=1000)[1],0,"上週大戶人數");
outputfield(3,GetField("大戶持股人數","W",param:=1000)-GetField("大戶持股人數","W",param:=1000)[1],0,"大戶增加數");
outputfield(4,GetField("散戶持股人數","W",param:=400),0,"本週散戶人數");
outputfield(5,GetField("散戶持股人數","W",param:=400)[1],0,"上週散戶人數");
outputfield(6,GetField("散戶持股人數","W",param:=400)-GetField("散戶持股人數","W",param:=400)[1],0,"散戶減少數");