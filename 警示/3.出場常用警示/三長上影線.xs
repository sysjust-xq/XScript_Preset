{@type:sensor}
input: Percent(1.5); setinputname(1,"上影線佔股價絕對百分比");

settotalbar(5);

condition1 = (high- maxlist(open,close)) > absvalue(open-close)*3; 
condition2 = high > maxlist(open, close) * (100 + Percent)/100;

if trueall( condition1 and condition2, 3) then ret=1;
