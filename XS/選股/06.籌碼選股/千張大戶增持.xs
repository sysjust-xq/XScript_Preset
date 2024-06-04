{@type:filter|@guid:116254ea7c794e3fbe952a49c9be1c11|@path:/06.籌碼選股/千張大戶增持}
input: ratio(10, "增加比例%");

setbarfreq("W");
settotalbar(3);

if GetField("大戶持股比例","W",param:=1000) > (GetField("大戶持股比例","W",param:=1000)[1] * (1 + ratio/100)) then ret=1;

outputfield(1, GetField("大戶持股比例","W",param:=1000), 2, "大戶比例");
outputfield(2, GetField("大戶持股比例","W",param:=1000)[1], 2, "大戶比例[1]");