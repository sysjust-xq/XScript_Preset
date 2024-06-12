{@type:filter}
input: periods(3, "連續期別");

setbarfreq("W");
settotalbar(periods+2);

condition1 = trueall(getfield("大戶持股比例", "W", param:=1000) > getfield("大戶持股比例", "W", param:=1000)[1], periods);
condition2 = trueall(getfield("散戶持股比例", "W", param:=400) < getfield("散戶持股比例", "W", param:=400)[1], periods);

ret= condition1 and condition2;

outputfield(1, getfield("大戶持股比例", "W", param:=1000), 2, "大戶比例");
outputfield(2, getfield("散戶持股比例", "W", param:=400), 2, "散戶比例");