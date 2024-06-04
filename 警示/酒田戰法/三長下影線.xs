{@type:sensor|@guid:10ce4677f641422c8eac4adf6994bf37|@path:/酒田戰法/三長下影線}
input: Percent(1.5); setinputname(1,"下影線佔股價絕對百分比");
settotalbar(5);

condition1 = (minlist(open,close)-Low) > absvalue(open-close)*3; 
condition2 =  minlist(open, close)  > low* (100 + Percent)/100;

if trueall( condition1 and condition2, 3) then ret=1;