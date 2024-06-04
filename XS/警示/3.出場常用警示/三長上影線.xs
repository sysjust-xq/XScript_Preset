{@type:sensor|@guid:18e2a81dfa5b45f9928b45aba1fd0e8c|@path:/3.出場常用警示/三長上影線|@hash:5a1d46d07548a0fb8adbde21f8ae50f1}
input: Percent(1.5); setinputname(1,"上影線佔股價絕對百分比");

settotalbar(5);

condition1 = (high- maxlist(open,close)) > absvalue(open-close)*3; 
condition2 = high > maxlist(open, close) * (100 + Percent)/100;

if trueall( condition1 and condition2, 3) then ret=1;
