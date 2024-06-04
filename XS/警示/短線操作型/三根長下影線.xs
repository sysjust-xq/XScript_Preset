{@type:sensor|@guid:7e5d2343eeb0438ba3cf8ea1674b546b|@path:/短線操作型/三根長下影線}
input: Percent(1.5); setinputname(1,"下影線佔股價絕對百分比");

settotalbar(5);

condition1 = (minlist(open,close)-low) > absvalue(open-close)*3; 
condition2 = minlist(open,close) > low * (100 + Percent)/100;

if trueall( condition1 and condition2, 3) then ret=1;
